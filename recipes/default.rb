#
# Cookbook:: chef_automate_cookbook
# Recipe:: default
#
# Copyright:: 2017, rx007, All Rights Reserved.
include_recipe 'chef-vault'

automate_defaults = chef_vault_item("setup_info", "automate_defaults")

case node['platform_family']

when 'rhel'
  yum_repository 'chef-stable' do
    description  'Chef Repository'
    baseurl      'https://packages.chef.io/repos/yum/stable/el/7/\$basearch/'
    gpgkey       'https://packages.chef.io/chef.asc'
    action       :create
  end

when 'debian'
  package 'apt-transport-https' do
    action :install
  end

  apt_repository 'chef-stable' do
    uri          'https://packages.chef.io/repos/apt/stable'
    components ['main']
    distribution node['lsb']['codename']
    deb_src      false
    key          'https://packages.chef.io/chef.asc'
  end

  apt_update 'update trusty' do
    action :update
  end

else
  log "Does not maintain packages for platform #{node['platform']}. Cannot setup the upstream repo!" do
    level :warn
  end
end

package 'delivery' do
  action :install
end

file node['chef_automate']['delivery_license'] do
  owner 'root'
  group 'root'
  mode '00644'
  action :create
end

file node['chef_automate']['delivery_pem'] do
  content automate_defaults['delivery_pem']
  owner 'root'
  group 'root'
  mode '00644'
  action :create
end

execute 'automate-ctl preflight-check' do
  command '/usr/bin/automate-ctl preflight-check'
end

execute 'automate-ctl setup' do
  command "/usr/bin/automate-ctl setup --license /root/delivery.license --key /root/delivery.pem --server-url #{automate_defaults['chef_url']} --fqdn #{automate_defaults['automate_url']} "
  not_if { ::File.exist?('/etc/delivery/delivery.rb') }
  action :run
end

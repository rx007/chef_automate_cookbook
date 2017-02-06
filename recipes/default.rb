#
# Cookbook:: chef_automate_cookbook
# Recipe:: default
#
# Copyright:: 2017, rx007, All Rights Reserved.

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

execute 'automate-ctl_preflight_check' do
  command '/usr/bin/automate-ctl preflight-check'
end

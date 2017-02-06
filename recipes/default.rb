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

  apt_repository 'nginx' do
    uri          'https://packages.chef.io/repos/apt/stable'
    distribution node['lsb']['codename']
    deb_src      false
    key          'https://packages.chef.io/chef.asc'
  end


else
  log "Does not maintain packages for platform #{node['platform']}. Cannot setup the upstream repo!" do
    level :warn
  end
end

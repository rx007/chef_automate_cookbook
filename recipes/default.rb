#
# Cookbook:: chef_automate_cookbook
# Recipe:: default
#
# Copyright:: 2017, rx007, All Rights Reserved.

case node['platform_family']
when 'rhel'

when 'debian'

else
  log "Does not maintain packages for platform #{node['platform']}. Cannot setup the upstream repo!" do
    level :warn
  end
end


package 'tree' do
   action :install
end

package 'ntp' do
  action :install
end

package 'git' do
  action :install
end

package 'vim-enhanced'


# node object is global
# node['ipaddress']
# node['memory']['total']
puts "The ip address is #{node['ipaddress']}"

template '/etc/motd' do
  source 'motd.erb'
  variables(
     :name => 'Deepanshu Lulla'
  )
  owner 'root'
  group 'root'
  action :create
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members 'user1'
end

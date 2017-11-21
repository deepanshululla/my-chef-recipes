
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

file '/etc/motd' do
  content "Hope you are having a great day.This vm belongs to Deepanshu
  HOSTNAME: #{node['hostname']}
  IP ADDRESS: #{node['ipaddress']}
  MAC Address: #{node['macaddress']}
  CPU: #{node['cpu']['0']['mhz']}
  MEMORY: #{node['memory']['total']}
  \n"
  owner 'root'
  group 'root'
  action :create
end

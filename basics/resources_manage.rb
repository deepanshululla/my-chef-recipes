
package 'tree' do
   action :install
end

package 'ntp' do
  action :install
end

file '/etc/motd' do
  content "Hope you are having a great day.This vm belongs to ..."
  owner 'root'
  group 'root'
  action :create
end

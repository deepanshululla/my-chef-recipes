#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved
# .

package 'httpd' do
   action :install
end

cookbook_file '/var/www/html/index.html' do
   source 'index.html'
end

remote_file '/var/www/html/dl.jpg' do
   source "https://www.askideas.com/wp-content/uploads/2016/11/Hello-How-Are-You-Funny-Mr.-Bean-Baby-Image.jpg" 
end

#template '/var/www/html/index.html' do
#  source 'index.html.erb'
#  variables({
#    :name => 'Deepanshu Lulla'
#  })
#  action :create
#end

#bash "inline script" do
#  user "root"
#  code "mkdir -p /var/www/mysites && chown -R apache /var/www/mysites/"
  # not_if '[-d /var/www/mysites/ ]' 
  #if the directory /var/www/mysites exist don't execute the command
  # alternatively we can use Ruby For executing recipes
#  not_if do
#     File.directory?('/var/www/mysites')
#  end
#end

execute "run a script" do
   user "root"
   command <<-EOH
   mkdir -p /var/www/mysites
   chown -R apache /var/www/mysites
  EOH
end

#execute "run script" do
#  user "root"
#  command "./myscript.sh"
#  not_if
#end

directory "/var/www/mysites" do
  owner 'apache'
  recursive true
end

service 'httpd' do
   action [:enable, :start]
end

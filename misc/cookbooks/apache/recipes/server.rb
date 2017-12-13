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

service 'httpd' do
   action [:enable, :start]
end

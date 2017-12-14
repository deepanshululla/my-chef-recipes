#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved
# .

package 'httpd' do
   action:install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables({
    :name => 'Deepanshu Lulla'
  })
  #action :create
  # what the next line does is restarts the apache2 in case there is a change in the index html file
 # notifies :restart, 'service[httpd]', :immediately
end


service 'httpd' do
   action [:enable, :start]
   # the next line restarts the service if there is a change in index.html. 
   subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

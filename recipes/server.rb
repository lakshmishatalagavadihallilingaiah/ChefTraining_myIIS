#
# Cookbook:: myiis
# Recipe:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
	code 'Add-WindowsFeature Web-Server'
end

file 'C:\inetpub\wwwroot\Default.htm' do
	content '<h1>hello, world!<h1>'
	<h2>platform: #{node['platform']}</h2>
	<h2>hostname: #{node['hostname']}</h2>
	<h2>mem: #{node['memory']['total']}</h2>
	<h2>cpu mhz: #{node['cpu']['0']['mhz']}</h2>
end

service 'w3svc' do
	action [:enable, :start]
end

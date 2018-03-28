powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
end

# file 'C:\inetpub\wwwroot\Default.htm' do
#   content "<h1>Hello, world!</h1>
#   <h2>PLATFORM: #{node['platform']}</h2>
#   <h2>HOSTNAME: #{node['hostname']}</h2>
#   <h2>MEMORY:   #{node['memory']['total']}</h2>
#   <h2>CPU Mhz:  #{node['cpu']['0']['mhz']}</h2>"
# end

template 'C:\inetpub\wwwroot\Default.htm' do
  source 'Default.htm.erb'
end

service 'w3svc' do
  action [:start, :enable]
end

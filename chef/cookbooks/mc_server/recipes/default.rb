#
# Cookbook Name:: mc_server
# Recipe:: default
#
# Source: https://supermarket.chef.io/cookbooks/minecraft-server#example-usage

# installs all dependencies
minecraft_depend 'dependencies' do
  install_all true
end

# installs the server and service files
minecraft_server 'test' do
  eula true
  action :create
end

# set properties for the server
server_properties 'test' do
  settings({
    :motd => 'Welcome to a Chef example server!',
    :enable_command_block => true,
    :difficulty => 3
  })
end

# starts the server
minecraft_service 'test' do
  commands 'say Server is now online!'
  action :start
end

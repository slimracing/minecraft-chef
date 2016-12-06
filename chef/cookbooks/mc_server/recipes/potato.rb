#
# Cookbook Name:: mc_server
# Recipe:: potato
#
# Source: https://supermarket.chef.io/cookbooks/minecraft-server#example-usage

# installs all dependencies
minecraft_depend 'dependencies' do
  install_all true
end

# installs the server and service files
minecraft_server 'potato' do
  eula true
  action :create
  world "file:///vagrant/POTATO.zip"
end

# set properties for the server
server_properties 'potato' do
  settings({
    :motd => 'Welcome to POTATO minecraft server!',
    :enable_command_block => true,
    :difficulty => 2
  })
end

# starts the server
minecraft_service 'potato' do
  commands 'say Server is now online!'
  action :start
end

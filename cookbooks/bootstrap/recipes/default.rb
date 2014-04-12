#
# Cookbook Name:: base
# Recipe:: default



package "curl" do
    action :install
end

execute "apt-get update"

package "ruby1.9.3" do
    action :install
end

execute "install chef" do
    command "curl -L https://www.opscode.com/chef/install.sh | sudo bash"
    not_if "dpkg -l chef"
end

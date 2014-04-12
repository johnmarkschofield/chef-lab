#
# Cookbook Name:: base
# Recipe:: default

include_recipe "bootstrap"

CHEFURL="https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/"
CHEFPACKAGE="chef-server_11.0.11-1.ubuntu.12.04_amd64.deb"

execute "download chef server" do
    command "curl -L #{CHEFURL}#{CHEFPACKAGE} -o /root/#{CHEFPACKAGE}"
    creates "/root/#{CHEFPACKAGE}"
end

execute "install chef server" do
    command "dpkg -i /root/#{CHEFPACKAGE}"
    not_if "dpkg -l chef-server"
end

execute "configure chef server" do
    command "chef-server-ctl reconfigure"
end


execute "gem install berkshelf" do
    not_if "gem list --local | grep -q berkshelf"
end

execute "install berkshelf cookbooks" do
    command "berks install"
    cwd "/vagrant"
end

########################## install mysql
# execute 'install mysql57-community-release-el7-9.noarch' do
#     command 'rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm'
#     not_if 'rpm -qa | grep mysql57-community-release-el7-9.noarch'
# end

# package 'mysql-community-server' do
#  action :install
# end
# puts node['nginx']['web_dir'].inspect


# action :start do
#   svc_manager do
#     action :start
#   end
# end





mysql_service 'fooooo' do
  port '3306'
  version '5.7'
  initial_root_password '32hoi2klkla|3i2'
  action [:create, :start]
end
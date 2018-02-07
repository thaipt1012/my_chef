########################## install nginx
['sudo', 'epel-release', 'nginx'].each do |p|
  package p do
    action :install
  end
end

########################## install php way 1

execute 'epel-release-latest-7' do
 command 'rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
 not_if 'rpm -qa | grep epel-release-7-[0-9]*.noarch'
end

execute 'install remi-release-7' do
 command 'rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm'
 not_if 'rpm -qa | grep remi-release-7.*'
end

package 'yum-utils' do
 action :install
end

execute 'ennable_php_71' do
 command 'yum-config-manager --enable remi-php71'
end

%w(php php-cli php-common php-curl php-json php-mbstring php-mcrypt php-mysql php-fpm php-pdo php-gd php-xml php-zip).each do |p|
  package p do
    action :install
  end
end

########################## install php way 2
=begin
execute 'epel-release-latest-7' do
 command 'rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
 not_if 'rpm -qa | grep epel-release-7-[0-9]*.noarch'
end

execute 'install webtatic-release' do
 command 'rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm'
 not_if 'rpm -qa | grep webtatic-release*.'
end

%w(php71w-cli php71w-common php71w-curl php71w-json php71w-mbstring php71w-mcrypt php71w-mysql php71w-fpm php71w-pdo php71w-gd php71w-xml php71w-zip).each do |p|
  package p do
    action :install
  end
end

########################## install composer
execute 'download composer' do
 command 'curl -sS https://getcomposer.org/installer | php'
end

execute 'move to /usr/local/bin/' do
 command 'mv -f composer.phar /usr/local/bin/composer'
end
=end
########################## install mysql
execute 'install mysql57-community-release-el7-9.noarch' do
 command 'rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm'
 not_if 'rpm -qa | grep mysql57-community-release-el7-9.noarch'
end

package 'mysql-community-server' do
 action :install
end

########################## install nodejs and npm
execute 'install nodejs_9.x' do
 command 'curl -sL https://rpm.nodesource.com/setup_9.x | bash -'
end

package 'nodejs' do
  action :install
end

########################## install yarn
package 'wget' do
  action :install
end

execute 'download yarn repo' do
 command 'wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo'
end

package 'yarn' do
  action :install
end


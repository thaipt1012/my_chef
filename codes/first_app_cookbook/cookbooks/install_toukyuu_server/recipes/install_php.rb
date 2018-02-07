########################## install php
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

### start php-fpm
service 'php-fpm' do
    action [:enable, :start]
end

########################## install composer
execute 'download composer' do
    command 'curl -sS https://getcomposer.org/installer | php'
    not_if { File.exist?('/usr/local/bin/composer') || File.exist?('composer.phar') }
end

execute 'move to /usr/local/bin/' do
    command 'mv -f composer.phar /usr/local/bin/composer'
    not_if { File.exist?('/usr/local/bin/composer' || !File.exist?('composer.phar')) }
end

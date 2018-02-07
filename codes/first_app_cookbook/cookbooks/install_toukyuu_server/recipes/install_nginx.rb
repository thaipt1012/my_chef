######################### install nginx
['epel-release', 'nginx'].each do |p|
    package p do
        action :install
    end
end

#######################config nginx
template '/etc/nginx/conf.d/default.conf' do
    source 'default.conf.erb'
end

# puts 'mkdir ' + node['nginx']['web_dir']

execute 'create web directory' do
    command 'mkdir -p ' + node['nginx']['web_dir']
    not_if { Dir.exist?(node['nginx']['web_dir']) }
end

#######################start nginx
service 'nginx' do
    action [:enable, :start]
end
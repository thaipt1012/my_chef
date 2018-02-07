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

c_name=t_1 | docker run -itd --name=$c_name --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes:/home --tmpfs /run $image /sbin/init | docker exec -it $c_name bash | cd /home/centos_test_chef/ | ./1_install_ruby.sh | cd /home/Chef




c_name=t_1
image="centos:7.3.1611"
docker run -itd --name=$c_name --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes:/home --tmpfs /run $image /sbin/init
docker exec -it $c_name bash
cd /home/centos_test_chef/
. ./1_install_ruby.sh
cd /home/Chef


c_name=t_2
image="centos:7.3.1611"
docker run -itd --name=$c_name --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes:/home --tmpfs /run $image /sbin/init
docker exec -it $c_name bash
cd /home/centos_test_chef/
. ./1_install_ruby.sh
cd /home/Chef


c_name=t_3
image="centos:7.3.1611"
docker run -itd --name=$c_name --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes:/home --tmpfs /run $image /sbin/init
docker exec -it $c_name bash
cd /home/centos_test_chef/
. ./1_install_ruby.sh
cd /home/Chef


c_name=t_4
image="centos:7.3.1611"
docker run -itd --name=$c_name --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes:/home --tmpfs /run $image /sbin/init
docker exec -it $c_name bash
cd /home/centos_test_chef/
. ./1_install_ruby.sh
cd /home/Chef









docker run -itd --name=$c_name --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes:/home --tmpfs /run $image /sbin/init
docker exec -it $c_name bash










docker run -itd --name=t_2 --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes/centos_test_chef:/home --tmpfs /run $image /usr/sbin/init   OK
docker run -itd --name t_3 --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /home/pham.tri.thai/codes/centos_test_chef:/home --tmpfs /run $image /sbin/init                              OK




curl -u "${gitUsername}:${gitPassword}" --data "${strData}" https://gitlab.com/api/v4/user/keys

gitUsername="thaipt1012@gmail.com"
gitPassword=""
userToken=""
keyTitle="test-$(hostname)"
publicSshKey=$(cat ~/.ssh/id_rsa.pub)
strData='{"title":"'${keyTitle}'","key":"'${publicSshKey}'"}'
curl --data-urlencode "private_token=${userToken}" --data-urlencode "key=$publicSshKey" --data-urlencode "title=$keyTitle" https://gitlab.com/api/v4/user/keys  => OK



token=""
email="pham.tri.thai@framgia.com"
username="FR_thaipt1012"
password=""
projectUrl="pj-gitlab.trifort.jp/tokyu/Server.git"

git clone https://gitlab-ci-token:$token@$projectUrl
git clone https://$username:$token@$projectUrl








chef-client --local-mode --runlist 'recipe[install_toukyuu_server::install_mysql],recipe[install_toukyuu_server::install_nodejs]'


        set -e
        rm -rf /tmp/mysql-foo
        mkdir /tmp/mysql-foo

        cat > /tmp/mysql-foo/my.sql <<-'EOSQL'
UPDATE mysql.user SET password=PASSWORD('seh32lkjl2k|s3') WHERE user = 'root';
DELETE FROM mysql.user WHERE USER LIKE '';
DELETE FROM mysql.user WHERE user = 'root' and host NOT IN ('127.0.0.1', 'localhost');
FLUSH PRIVILEGES;
DELETE FROM mysql.db WHERE db LIKE 'test%';
DROP DATABASE IF EXISTS test ;
EOSQL

       mysql_install_db --defaults-file=/etc/mysql-foo/my.cnf --datadir=/var/lib/mysql-foo --explicit_defaults_for_timestamp
       /usr/sbin/mysqld --defaults-file=/etc/mysql-foo/my.cnf --init-file=/tmp/mysql-foo/my.sql --explicit_defaults_for_timestamp &

       while [ ! -f /var/run/mysql-foo/mysqld.pid ] ; do sleep 1 ; done
       kill `cat /var/run/mysql-foo/mysqld.pid`
       while [ -f /var/run/mysql-foo/mysqld.pid ] ; do sleep 1 ; done
       rm -rf /tmp/mysql-foo


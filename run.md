

docker-compose up -d
docker-compose scale consul=3 ceph-mon=3 ceph-osd=3 ceph-mds=3 mariadb-haproxy=2 mariadb=3 nginx=2 php=3

После установки, мы получим:

3 Consul nodes in cluster
Ceph cluster with 3 monitors, 3 OSDs and 3 metadata servers
2 HAProxy instances for MariaDB load balancing
3 MariaDB Galera nodes in cluster with Master-Master replication mode
2 Nginx instances
3 PHP-FPM instances
1 PhpMyAdmin instance to work with MariaDB Galera cluster in GUI mode
1 SSH server to access files and configs

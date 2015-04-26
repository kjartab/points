sudo su

cd /home/vagrant

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list'

wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

apt-get update

apt-get install -y postgresql-9.4 pgadmin3 postgresql-contrib

apt-get install -y postgresql-9.4-postgis-2.1 pgadmin3 postgresql-contrib

apt-add-repository -y ppa:georepublic/pgrouting
apt-get update
apt-get install -y postgresql-9.4-pgrouting

exit

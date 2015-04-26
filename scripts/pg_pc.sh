
cd /home/vagrant

git clone git://github.com/pgpointcloud/pointcloud.git pgpointcloud/pointcloud

cd pgpointcloud/pointcloud

sudo apt-get update

 sudo apt-get install -q postgresql-server-dev-9.3 libcunit1-dev

./autogen.sh

./configure CFLAGS="-Wall -O2 -g"

make

sudo make install

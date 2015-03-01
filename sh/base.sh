sudo su
apt-get install -y python-software-properties

add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
apt-get update

apt-get install -y g++
#add-apt-repository -y ppa:ubuntu-toolchain-r/test
#apt-get update
#apt-get install -y g++-4.9


apt-get install -y git build-essential libjsoncpp-dev pkg-config cmake libflann-dev libgdal-dev libpq-dev libproj-dev libtiff4-dev libgeos-dev python-all-dev python-numpy libxml2-dev libboost-all-dev libbz2-dev cmake-curses-gui libcunit1-dev libgeos++-dev
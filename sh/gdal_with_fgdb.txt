#! /bin/bash
#install buildtools and package libraries
sudo apt-get -y install build-essential
sudo apt-get -y install libproj-dev
sudo apt-get -y install libgeos-dev
sudo apt-get -y install libgeoip-dev
sudo apt-get -y install libnetcdf-dev
sudo apt-get -y install netcdf-bin
 
# install java jdk for mdb support
sudo apt-get -y install openjdk-7-jdk
 
# move to the install directory and unarchive
cd /usr/local/bin
sudo tar -zxvf FileGDB_API_1_3-64.tar.gz
 
# optional (but good practice), build and run examples to confirm that it's working.
cd FileGDB_API/samples
make
cd bin
# the following should return a list of cities
./Querying
 
# configure path variables and update ldconfig
LD_LIBRARY_PATH=/usr/local/bin/FileGDB_API/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
 
sudo sh -c "echo '/usr/local/bin/FileGDB_API/lib' > /etc/ld.so.conf.d/fgdb.conf"
sudo ldconfig
 
# download and unarchive GDAL
cd /usr/local/bin
sudo wget http://download.osgeo.org/gdal/1.11.0/gdal-1.11.0.tar.gz
sudo tar -zxvf gdal-1.11.0.tar.gz
cd gdal-1.11.0
 
# configure GDAL to compile with whatever packages you'd like
# see the full list at ./configure --help
sudo ./configure --with-pg --with-fgdb=/usr/local/bin/FileGDB_API --with-geos --with-netcdf --with-java=yes --with-mdb=yes --with-python
# configure should print a list with "yes" next to successfully assembled packages
 
# install the custom GDAL build
sudo make
sudo make install
 
# tell ld where the GDAL libraries are
sudo sh -c "echo '/usr/local/bin/' > /etc/ld.so.conf.d/local.conf"
sudo sh -c "echo '/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server' > /etc/ld.so.conf.d/java.conf"
sudo ldconfig
 
# clean up
sudo rm /usr/local/bin/FileGDB_API_1_3-64.tar.gz
sudo rm /usr/local/bin/gdal-1.11.0.tar.gz
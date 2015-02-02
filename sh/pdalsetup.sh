#!/usr/bin/env bash

### Get dependencies in place
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

sudo apt-get install -y --force-yes autoconf build-essential cmake docbook-mathml docbook-xsl libboost-dev libboost-filesystem-dev libboost-timer-dev libcgal-dev libcunit1-dev libgdal-dev libgeos++-dev libgeotiff-dev libgmp-dev libjson0-dev libjson-c-dev liblas-dev libmpfr-dev libopenscenegraph-dev libpq-dev libproj-dev libxml2-dev postgresql-server-dev-9.3 xsltproc git build-essential wget 

# Install postgres
sudo apt-get install -y --force-yes postgresql 

sudo mkdir /opt/source


### SFCGAL and PostGIS

# SFCGAL (full 3D support)
git clone https://github.com/Oslandia/SFCGAL.git
cd SFCGAL && cmake . && make -j3 && sudo make install
cd ..

cd /opt/source
# PostGIS
wget http://download.osgeo.org/postgis/source/postgis-2.1.3.tar.gz
tar -xzf postgis-2.1.3.tar.gz
cd postgis-2.1.3 && ./configure --with-sfcgal=/usr/local/bin/sfcgal-config
make -j2 && sudo make install
cd ..

### pgRouting and PDAL



cd /opt/source
# pgRouting
git clone https://github.com/pgRouting/pgrouting.git &&\
    cd pgrouting &&\
    mkdir build && cd build &&\
    cmake -DWITH_DOC=OFF -DWITH_DD=ON .. &&\
    make -j3 && sudo make install
cd ../..


# get additional packages

### also need boost
sudo apt-get install -y libboost-all-dev

# and laszip
sudo apt-get install -y git cmake g++

# get the latest released version
cd /opt/source
wget http://download.osgeo.org/laszip/laszip-2.1.0.tar.gz
tar xvfz laszip-2.1.0.tar.gz
cd laszip-2.1.0
mkdir build
mkdir cmake_build
cd cmake_build
# run cmake
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/source/laszip-2.1.0/build
# compile
make -j$threads
# install into build dir
make install

### add to /opt/source/scripts/export_paths.sh (see Preliminaries)
### then run: 'source export_paths.sh' to update these environment paths
export LD_LIBRARY_PATH="/opt/source/laszip-2.1.0/build/lib:$LD_LIBRARY_PATH"
export PATH="/opt/source/laszip-2.1.0/build/bin:$PATH"

# test install (also run with --libs and --includes parameters to check stored paths)
laszip-config --version
# run another test utility
laszippertest
rm test.tmp zippertest.log







## continue 
cd /opt/source

# PDAL -- Point Cloud Abstraction Library
git clone https://github.com/PDAL/PDAL.git pdal &&\
    mkdir PDAL-build &&\
    cd PDAL-build && cmake ../pdal &&\
    make -j3 && sudo make install
cd ..

### PointCloud

# PointCloud extension for PostgreSQL and PostGIS
git clone https://github.com/pramsey/pointcloud.git
    cd pointcloud &&\
    ./autogen.sh &&\
    ./configure &&\
    make -j3 &&\
    sudo make install
cd ..

### Finish up...

sudo ldconfig

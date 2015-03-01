#!/bin/bash -e
# Installs LASzip library

cd /home/vagrant
git clone https://github.com/LASzip/LASzip.git laszip
cd laszip
cmake . -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
sudo ldconfig
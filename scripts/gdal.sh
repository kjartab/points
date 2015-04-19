
cd /home/vagrant
wget http://download.osgeo.org/gdal/1.11.0/gdal-1.11.0.tar.gz
tar xvfz gdal-1.11.0.tar.gz
cd gdal-1.11.0

./configure --with-python
make
sudo make install
sudo ldconfig
cd /home/vagrant
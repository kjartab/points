cd /home/vagrant
wget http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-1.4.0.tar.gz
tar -xzf libgeotiff-1.4.0.tar.gz
cd libgeotiff-1.4.0
./configure --prefix=/usr && make && sudo make install
cd /home/vagrant
sudo ldconfig
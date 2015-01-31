
### On Ubuntu
sudo apt-get install git libxml2-dev python-numpy
sudo apt-get install build-essential python-all-dev -y


cd /vagrant

## Install GDAL


wget http://download.osgeo.org/gdal/1.11.0/gdal-1.11.0.tar.gz

tar xvfz gdal-1.11.0.tar.gz

cd gdal-1.11.0

./configure --with-python
make
sudo make install


## Get source code

cd /opt/source
sudo git clone https://github.com/PDAL/PDAL.git pdal-trunk
cd pdal-trunk
mkdir cmake_build
mkdir build
cd cmake_build


## run cmake
# - these options can also be set interactively inside ccmake
# - the laszip, p2g, and flann options at the end are optional


ccmake .. \
  -DCMAKE_INSTALL_PREFIX=/opt/source/pdal-trunk/build \
  -DWITH_LIBXML2=on \
  -DWITH_PYTHON=on \
  -DPDAL_EMBED_BOOST=on \
  -DWITH_GEOTIFF=on \
  -DGEOTIFF_INCLUDE_DIR=/opt/source/libgeotiff-1.4.0/build/include \
  -DGEOTIFF_LIBRARY=/opt/source/libgeotiff-1.4.0/build/lib/libgeotiff.so \
  -DTIFF_INCLUDE_DIR=/opt/source/tiff-4.0.3/build/include \
  -DTIFF_LIBRARY=/opt/source/tiff-4.0.3/build/lib/libtiff.so \
  -DWITH_GDAL=on \
  -DGDAL_CONFIG=/opt/source/gdal-trunk/build/bin/gdal-config \
  -DGDAL_INCLUDE_DIR=/opt/source/gdal-trunk/build/include \
  -DGDAL_LIBRARY=/opt/source/gdal-trunk/build/lib/libgdal.so \
  -DGEOS_CONFIG=/opt/source/geos-3.3.8/build/bin/geos-config \
  -DGEOS_INCLUDE_DIR=/opt/source/geos-3.3.8/build/include \
  -DGEOS_CONFIG_PREFER_PATH=/opt/source/geos-3.3.8/build/bin \
  -DWITH_LASZIP=on \
  -DLASZIP_INCLUDE_DIR=/opt/source/laszip-2.1.0/build/include \
  -DLASZIP_LIBRARY=/opt/source/laszip-2.1.0/build/lib/liblaszip.so \
  -DWITH_P2G=on \
  -DP2G_INCLUDE_DIR=/opt/source/p2g-trunk/build/include \
  -DP2G_LIBRARY=/opt/source/p2g-trunk/build/lib/libpts2grd.so \
  -DWITH_FLANN=on \
  -DFLANN_INCLUDE_DIR=/opt/source/flann-1.8.4-src/build/include \
  -DFLANN_LIBRARY=/opt/source/flann-1.8.4-src/build/lib/libflann.so \
  -DFLANN_LIBRARY_DEBUG=/opt/source/flann-1.8.4-src/build/lib/libflann.so \

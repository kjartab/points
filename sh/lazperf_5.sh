#!/bin/bash -e
# Installs laz-perf library


cd /home/vagrant
git clone https://github.com/verma/laz-perf.git
cd laz-perf;  cmake .; make; sudo make install
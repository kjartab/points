
from subprocess import call
import os

rootdir = '/vagrant/las-data-xml'
 
for root, dirs, filenames in os.walk(rootdir):
	for thefile in filenames:
		if thefile is not 'LiDARloading.py':
			os.system("pdal pipeline " +rootdir +'/'+thefile)
	
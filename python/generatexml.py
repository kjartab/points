
import xml.etree.ElementTree as ET 
import os

lidardir = '/vagrant/Melhus/DTM20/las-data/'
destdir = '/vagrant/las-data-xml/'

filestoload = []

for root, dirs, filenames in os.walk(lidardir):
	for thefile in filenames:
		filestoload.append(thefile)
print 'test'
for fname in filestoload:
    
	tree = ET.parse('pc2pg.xml')
	root = tree.getroot()
	
	for elem in root.iter('Option'):
	
		if elem.attrib['name']=='filename':
			elem.text=lidardir+fname
			storetofile = fname[:-4] +'.xml'
			f = open(destdir+storetofile,'w')
			f.write(ET.tostring(root, encoding='utf8', method='xml'))
			f.close()

print 'created',len(filestoload), "files"

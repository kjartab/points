from multiprocessing import Pool
from subprocess import call
import os
import datetime

rootdir = '/vagrant/las-data-xml'
 
filesToLoad = []


startScript = datetime.datetime.now()
print startScript.strftime("%d.%m.%y_%H:%M:%S") + ' Start loading \n'
    

for root, dirs, filenames in os.walk(rootdir):
    for file in filenames:
        filesToLoad.append(rootdir +'/'+file)

print "Files to load: " + str(len(filesToLoad)) + "\n";

results = 0

def pdal_pipeline(file_path):
    os.system("pdal pipeline " + file_path)
    print "loaded file: " + file_path    
    return 1
    
pool = Pool(8)
results = pool.map(pdal_pipeline, filesToLoad)
    

stopScript = datetime.datetime.now()


print stopScript.strftime("%d.%m.%y_%H:%M:%S") + ' Stop loading \n'



print 'Total run time: ' + str((stopScript - startScript).total_seconds())
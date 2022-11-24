import os
import re
import pathlib
import configparser
import subprocess
import datetime



# Datetime
timestamp = str(datetime.datetime.now().strftime("%Y.%m.%d"))
timestamp = timestamp[-8:]


# folder path
__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
dir_path = (os.path.join(__location__, 'source'))
dir_configFile = (os.path.join(__location__, 'config.ini'))
dir_thirdparty = (os.path.join(__location__, 'source\Third-party'))
dir_innoscript = (os.path.join(__location__, 'OneATSSetup.iss'))


# list to store files
res = []

# Iterate directory
for path in os.listdir(dir_path):
    # check if current path is a file
    if os.path.isfile(os.path.join(dir_path, path)):
        res.append(path)
        
#print(res)
 
# Read Config File
config= configparser.ConfigParser()
config.read(dir_configFile)

# Config file
config['Settings']['buildversion'] = timestamp
config['MongoDB']['mongodblicense']= dir_thirdparty+ "\\" + "MongoDBLicense.txt" 
config['MongoDB']['mongodbinitfolder']= dir_thirdparty+ "\\" + "MongoDB Initiate"  
config['Third-Party']['vsredisx86file']= dir_thirdparty+ "\\" + "Microsoft VC redistributable\VC_redist.x86.exe" 
config['Third-Party']['vsredisx64file']= dir_thirdparty+ "\\" + "Microsoft VC redistributable\VC_redist.x64.exe"
config['Third-Party']['pinsx64file']= dir_thirdparty+ "\\" + "PiSdk\PINS_x64.msi"
config['Third-Party']['pinsx86file']= dir_thirdparty+ "\\" + "PiSdk\PINS_x86.msi"
config['Third-Party']['pisdkfile']= dir_thirdparty+ "\\" + "PiSdk\pisdk.msi"   
config['Third-Party']['opccorex64file']= dir_thirdparty+ "\\" + "opc-core-components-redistributables-3.00.108-20191220\OPC Core Components Redistributable (x64) 3.00.108.msi"
config['Third-Party']['opccorex86file']= dir_thirdparty+ "\\" + "opc-core-components-redistributables-3.00.108-20191220\OPC Core Components Redistributable (x86) 3.00.108.msi"

def UpdateConfigFile(fileName):
    if ('dataserver' in fileName.lower()):
        config['DS_DE']['DSVersion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])   
        config['DS_DE']['dsfile']= dir_path + "\\" + fileName       
                
    if 'dataeditor' in fileName.lower():
        config['DS_DE']['DEVersion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['DS_DE']['defile']= dir_path+ "\\" + fileName
                
    if ('fep' in fileName.lower()):
        config['FEP']['fepversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        fepfile = dir_path + fileName       
        config['FEP']['fepfile']= dir_path+ "\\" + fileName 
                
    if 'hmi' in fileName.lower():
        config['HMI']['hmiversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['HMI']['hmifile']= dir_path+ "\\" + fileName
        
    if 'his' in fileName.lower():
        config['HIS']['hisversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['HIS']['hisfile']= dir_path+ "\\" + fileName  
        
    if('mongodb' in fileName.lower()):
        #config['MongoDB']['mongodbversion']= "4.2.23"
        config['MongoDB']['mongodbfile']= dir_path+ "\\" + fileName  
        
    
for filename in res:
    UpdateConfigFile(filename)

# Save Change in Config file
with open(dir_configFile, 'w') as configfile:    # save
    config.write(configfile)

# Compile Inno Script
###os.system('""C:\Program Files (x86)\Inno Setup 6\iscc.exe" "D:\Projects\OneATSSetup_InnoSetup\OneATSSetup.iss""')
subprocess.run(["C:\Program Files (x86)\Inno Setup 6\iscc.exe", dir_innoscript])




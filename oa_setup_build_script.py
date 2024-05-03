
import argparse
import os
import re
import pathlib
import configparser
import subprocess
import datetime
import os.path


# Commandline Argument
parser = argparse.ArgumentParser()
parser.add_argument('--working_dir', '-working_dir', dest='file_path', help = 'Path to input file')
dir_path = parser.parse_args()


# Datetime
timestamp = str(datetime.datetime.now().strftime("%Y.%m.%d"))
timestamp = timestamp[-8:]


# folder path
__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
dir_thirdparty = dir_path.file_path+ '\\Third-party'
dir_innoscript = (os.path.join(__location__, 'OneATSSetup.iss'))
dir_configFile = (os.path.join(__location__, 'config.ini'))


# list to store files
res = []

# Iterate directory
for path in os.listdir(str(dir_path.file_path)):
    # check if current path is a file
    if os.path.isfile(os.path.join(str(dir_path.file_path), path)):
        res.append(path)        
   
for path in os.listdir(dir_thirdparty):
     if os.path.isfile(os.path.join(str(dir_thirdparty), path)):
        res.append(path)

        
print(res)

 
# Config file
config= configparser.ConfigParser()

# Create config.ini file
config['Settings'] = {'buildversion':timestamp }
config['MongoDB'] = {'mongodblicense': '' , 'mongodbinitfolder':''  ,'mongodbversion': '4.2.5', 'mongodbfile': ''}          
config['FEP'] = {'fepversion': '',  'fepfile': ''}             
config['DS_DE'] = {'dsversion': '', 'dsfile': '', 'deversion': '','defile': ''}  
config['HMI'] = {'hmiversion': '',  'hmifile': '', 'hminame': ''} 
config['HIS'] = {'hisversion': '',  'hisfile': ''}
config['PSM'] = {'psmversion':'',   'psmfile': 'empty'}
config['Third-Party'] = {'vsredisx86version': '','vsredisx86file': '','vsredisx64version': '','vsredisx64file': '',
                         'pinsx86version': '','pinsx86file': '','pinsx64version': '', 'pinsx64file': '',
                         'pisdkversion': '','pisdkfile': '',
                         'opccorex86version': '3.00.108','opccorex86file': '','opccorex64version': '3.00.108','opccorex64file': ''  }
 
# Update 
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
        config['DS_DE']['dsfile']= str(dir_path.file_path) + "\\" + fileName       
                
    if 'dataeditor' in fileName.lower():
        config['DS_DE']['DEVersion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['DS_DE']['defile']= str(dir_path.file_path)+ "\\" + fileName
                
    if ('fep' in fileName.lower()):
        config['FEP']['fepversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['FEP']['fepfile']= str(dir_path.file_path)+ "\\" + fileName 
                
    if 'hmi' in fileName.lower():
        config['HMI']['hmiversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['HMI']['hmifile']= str(dir_path.file_path)+ "\\" + fileName
        config['HMI']['hminame']= fileName
        
    if 'his' in fileName.lower():
        config['HIS']['hisversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['HIS']['hisfile']= str(dir_path.file_path)+ "\\" + fileName 

    if 'psm' in fileName.lower():
        config['PSM']['psmversion']= (re.findall('[0-9.]*[0-9]+', fileName)[0])
        config['PSM']['psmfile']= str(dir_path.file_path)+ "\\" + fileName         
        
    if('mongodb-win' in fileName.lower()):
        #config['MongoDB']['mongodbversion']= "4.2.5"
        config['MongoDB']['mongodbfile']= dir_thirdparty + "\\" + fileName  
        
    
for filename in res:
    UpdateConfigFile(filename)

# Save Config file
with open(dir_configFile, 'w') as configfile:    # save
    config.write(configfile)

# Compile Inno Script
if os.path.isfile(dir_configFile) :
    subprocess.run(["C:\Program Files (x86)\Inno Setup 6\iscc.exe", dir_innoscript])
else:
    print('Can not compile inno script, check config file')

########################



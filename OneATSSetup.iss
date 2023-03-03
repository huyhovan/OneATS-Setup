#define App_ID "{4734210B-E8D5-4678-8EE6-F3D25856AFB0}"
#define App_CopyRight "Copyright (C)"
#define App_Name "OneATS Setup"  
#define App_Publisher "Applied Technical Systems Company, jsc."
#define App_URL "ats.com.vn"
#define App_ExeName "OneATSSetup"
#define App_InstallDir "{autopf}\ATS" 
#define App_Mongo4_2Dir  "{autopf}\MongoDB\Server\4.2"


#define App_ConfigFile SourcePath  + "\config.ini"    
#define App_BuildVersion        ReadIni(App_ConfigFile, "Settings", "BuildVersion", "")
#define App_OutputDir           ReadIni(App_ConfigFile, "Settings", "OutputDir", "")
#define App_MongoDBLicense      ReadIni(App_ConfigFile, "MongoDB", "MongoDBLicense", "")
#define App_MongoDBInitFolder   ReadIni(App_ConfigFile, "MongoDB", "MongoDBInitFolder", "")
#define App_MongoDBVersion      ReadIni(App_ConfigFile, "MongoDB", "MongoDBVersion", "")
#define App_MongoDBFile         ReadIni(App_ConfigFile, "MongoDB", "MongoDBFile", "")     
#define App_FepFile             ReadIni(App_ConfigFile, "Fep", "FepFile", "")
#define App_FepVersion          ReadIni(App_ConfigFile, "Fep", "FepVersion", "")
#define App_DSVersion           ReadIni(App_ConfigFile, "DS_DE", "DSVersion", "")
#define App_DSFile              ReadIni(App_ConfigFile, "DS_DE", "DSFile", "")
#define App_DEVersion           ReadIni(App_ConfigFile, "DS_DE", "DEVersion", "")
#define App_DEFile              ReadIni(App_ConfigFile, "DS_DE", "DEFile", "")
#define App_HMIVersion          ReadIni(App_ConfigFile, "HMI", "HMIVersion", "")
#define App_HMIFile             ReadIni(App_ConfigFile, "HMI", "HMIFile", "")
#define App_HMIName             ReadIni(App_ConfigFile, "HMI", "HMIName", "")
#define App_HISVersion          ReadIni(App_ConfigFile, "HIS", "HISVersion", "")
#define App_HISFile             ReadIni(App_ConfigFile, "HIS", "HISFile", "")
#define App_VSRedisx86Version   ReadIni(App_ConfigFile, "Third-Party", "VSRedisx86Version", "")
#define App_VSRedisx86File      ReadIni(App_ConfigFile, "Third-Party", "VSRedisx86File", "")
#define App_VSRedisx64Version   ReadIni(App_ConfigFile, "Third-Party", "VSRedisx64Version", "")
#define App_VSRedisx64File      ReadIni(App_ConfigFile, "Third-Party", "VSRedisx64File", "")
#define App_PiNSx86Version      ReadIni(App_ConfigFile, "Third-Party", "PiNSx86Version", "")
#define App_PiNSx86File         ReadIni(App_ConfigFile, "Third-Party", "PiNSx86File", "")
#define App_PiNSx64Version      ReadIni(App_ConfigFile, "Third-Party", "PiNSx64Version", "")
#define App_PiNSx64File         ReadIni(App_ConfigFile, "Third-Party", "PiNSx64File", "")
#define App_PiSDKVersion        ReadIni(App_ConfigFile, "Third-Party", "PiSDKVersion", "")
#define App_PiSDKFile           ReadIni(App_ConfigFile, "Third-Party", "PiSDKFile", "")
#define App_OpcCorex86Version   ReadIni(App_ConfigFile, "Third-Party", "OpcCorex86Version", "")
#define App_OpcCorex86File      ReadIni(App_ConfigFile, "Third-Party", "OpcCorex86File", "")
#define App_OpcCorex64Version   ReadIni(App_ConfigFile, "Third-Party", "OpcCorex64Version", "")
#define App_OpcCorex64File      ReadIni(App_ConfigFile, "Third-Party", "OpcCorex64File", "")


[Setup]
AppId = {{#App_ID}
AppName = {#App_Name}
AppVersion = {#App_BuildVersion}  
AppPublisher = {#App_Publisher}   
WizardStyle= modern                                        
DefaultDirName = {#App_InstallDir}  
DisableProgramGroupPage = 1                                                      
OutputBaseFilename= {#App_Name}_{#App_BuildVersion}     
Compression= lzma
SolidCompression =1
UserInfoPage = 0
;LicenseFile=License.txt
;ShowLanguageDialog =1
ArchitecturesInstallIn64BitMode=x64
ExtraDiskSpaceRequired= 580288000     
SetupLogging = yes    
        



[Types]
Name: "custom"; Description: "Custom installation"; Flags: iscustom
Name: "full"; Description: "Full installation"     


[Components]   
Name:"third_party"; Description:"Third-party"; Types: full;  Flags: disablenouninstallwarning; 
Name:third_party\VCRedistributable; Description:"Microsoft VC redistributable 2015-2019"; Types:  full; Flags: disablenouninstallwarning; 
Name:third_party\PiNS; Description:"Pi Network Systems"; Types: full;  Flags: disablenouninstallwarning;
Name:third_party\PiSDK; Description:"Pi SDK"; Types:full;  Flags: disablenouninstallwarning; 
Name:third_party\OpcCore; Description:"Opc-Core-Components-Redistributables ({#App_OpcCorex64Version})"; Types: full;  
Name:"MongoDB"; Description:"Mongo DB ({#App_MongoDBVersion})"; Types: full;  Flags: disablenouninstallwarning;
Name:"FEP"; Description: "Fep Server ({#App_FepVersion})"; Types: full;  Flags: disablenouninstallwarning;
Name:"Data"; Description:"Data Systems"; Types:  full; Flags: disablenouninstallwarning;
Name:Data\DataServer; Description:"Data Server ({#App_DSVersion})"; Types: full; Flags: disablenouninstallwarning; 
Name:Data\DE; Description:"Data Editor ({#App_DEVersion})"; Types: full;  Flags: disablenouninstallwarning; 
Name:"SmartHMI"; Description: "SmartHMI ({#App_HMIVersion})"; Types:full;   Flags: disablenouninstallwarning;
Name:"HIS"; Description: "HIS systems ({#App_HISVersion})"; Types:full;  Flags:  disablenouninstallwarning;
Name:"HIS\HisServer"; Description: "His Server"; Types:full;   Flags:  disablenouninstallwarning ;
Name:"HIS\AdminTools"; Description: "Admin Tools"; Types:full;  Flags: disablenouninstallwarning;
Name:"HIS\DataLink"; Description: "Data Link"; Types:full;   Flags: disablenouninstallwarning;
Name:"HIS\ODBCDriver"; Description: "ODBC Driver"; Types:full;   Flags: disablenouninstallwarning;  
Name:"HIS\WebService"; Description: "Web Service"; Types:full; Flags: disablenouninstallwarning;  
Name:"HIS\ReportViewer"; Description: "Report Viewer"; Types:full;   Flags: disablenouninstallwarning; 
Name:"HIS\DataClient"; Description: "Data Client"; Types: full; Flags: disablenouninstallwarning;
                                                                                                             
 

[UninstallDelete]
;Type: files; Name: "{app}\config.ini"
;Type: filesandordirs; Name: "{app}\MongoDB"

[Files]     
Source: {#App_MongoDBLicense}; Flags: dontcopy;
Source: "{#App_MongoDBInitFolder}\*";  DestDir:"{app}\MongoDB\MongoDB Initiate"; Flags:  ignoreversion recursesubdirs createallsubdirs deleteafterinstall;   Components:"MongoDB";
Source: {#App_MongoDBFile}; DestName: "mongodb.msi";  DestDir: {tmp}; Flags: deleteafterinstall  ; Components:"MongoDB";
Source: {#App_FepFile}; DestName: "fep.msi";  DestDir: {tmp}; Flags: deleteafterinstall  ; Components:"FEP";
Source: {#App_DSFile}; DestName: "dataserver.msi";  DestDir: {tmp}; Flags: deleteafterinstall ; Components:"Data\DataServer";
Source: {#App_DEFile}; DestName: "dataeditor.msi";  DestDir: {tmp}; Flags: deleteafterinstall  ; Components:"Data\DE";
Source: {#App_HMIFile}; DestDir:{app};  Flags: deleteafterinstall ignoreversion   ; Components:"SmartHMI";
Source: {#App_HISFile}; DestName: "SmartHis.msi";  DestDir: {tmp}; Flags: deleteafterinstall  ;  Components:HIS\HisServer HIS\AdminTools HIS\DataLink HIS\ODBCDriver HIS\WebService HIS\ReportViewer HIS\DataClient ;
Source: {#App_PiNSx86File}; DestName: "PINS.msi";  DestDir: {tmp}; Flags: deleteafterinstall  ; Components:"third_party\PiNS"; Check:"not IsWin64";
Source: {#App_PiNSx64File}; DestName: "PINS.msi";  DestDir: {tmp}; Flags: deleteafterinstall ; Components:"third_party\PiNS"; Check:"IsWin64";
Source: {#App_PiSDKFile}; DestDir:{tmp}; Flags: deleteafterinstall  ; Components:"third_party\PiSDK";
Source: {#App_VSRedisx86File}; DestDir:{app}; Flags: deleteafterinstall ignoreversion ; Components:"third_party\VCRedistributable";
Source: {#App_VSRedisx64File}; DestDir:{app}; Flags: deleteafterinstall ignoreversion ; Components:"third_party\VCRedistributable";
Source: {#App_OpcCorex64File}; DestName:"OpcRedistributablex64.msi"; DestDir :{tmp}; Flags: deleteafterinstall ; Components: "third_party\OpcCore"; 
Source: {#App_OpcCorex86File}; DestName:"OpcRedistributablex86.msi"; DestDir :{tmp}; Flags: deleteafterinstall ; Components: "third_party\OpcCore"; Check:" not IsWin64";

[Icons]
Name: "{autoprograms}\{#App_Name}"; Filename: "{app}\{#App_ExeName}";
//Name: "{autodesktop}\{#App_Name}"; Filename: "{app}\{#App_ExeName}"; Tasks:desktopicon;


[Run]  

Filename:"msiexec.exe"; Parameters: " /l*v mdbinstall.log /qn /i ""{tmp}\mongodb.msi"" ADDLOCAL=""ServerNoService""  SHOULD_INSTALL_COMPASS=""0"" INSTALLLOCATION=""{autopf}\MongoDB\Server\4.2\"" "; Flags:waituntilterminated; WorkingDir: {tmp};   Components:MongoDB;  StatusMsg: "Installing Database Server (MongoDB Server) ..."; 

Filename: "{cmd}"; Parameters: "/C ""md ""{code:GetMongoDataDir}"" ""{code:GetMongoLogDir}"" """; Flags: waituntilterminated skipifsilent; Components:MongoDB; check:"CheckInstallMongoDBsuccess";  
Filename: "{cmd}"; Parameters: "/C ""powershell copy-item '{app}\MongoDB\MongoDB Initiate\mongod.cfg' '{autopf}\MongoDB\Server\4.2\bin'  -force"""; Flags: waituntilterminated skipifsilent; Components:MongoDB; check:"CheckInstallMongoDBsuccess";  
Filename: "{cmd}"; Parameters: "/C ""powershell ""(Get-Content -Path '{autopf}\MongoDB\Server\4.2\bin\mongod.cfg') | Foreach-Object {{$_.replace('D:\db\data','{code:GetMongoDataDir}').replace('D:\db\log','{code:GetMongoLogDir}')} | Out-File -encoding ASCII 'C:\Program Files\MongoDB\Server\4.2\bin\mongod.cfg'"""""; Flags: nowait skipifsilent; Components:MongoDB; Check:"CheckInstallMongoDBsuccess"; 
Filename: "{cmd}"; Parameters: "/C ""copy ""{app}\MongoDB\MongoDB Initiate\oakeyfile.key""  ""{autopf}\MongoDB\Server\4.2\bin\"""""; Flags: nowait skipifsilent;Components:MongoDB;  check:"CheckInstallMongoDBsuccess";
;Filename: "{cmd}"; Parameters: "/C ""sc stop MongoDB"""; Flags: waituntilterminated skipifsilent; Check:"CheckInstallMongoDBsuccess";    
Filename: "{cmd}"; Parameters: "/C ""robocopy ""{app}\MongoDB\MongoDB Initiate\data"" ""{code:GetMongoDataDir}"" /s /e	 """; Flags: waituntilterminated skipifsilent; Components:MongoDB; Check:"IsMongoDataDirEmpty";
Filename: "{cmd}"; Parameters: "/C ""sc create ""MongoDB""  binPath= ""\""{autopf}\MongoDB\Server\4.2\bin\mongod.exe\"" --config \""{autopf}\MongoDB\Server\4.2\bin\mongod.cfg\"" --service"" DisplayName= ""MongDB Server""  start= ""auto"""""; Flags: waituntilterminated skipifsilent; Components:MongoDB; Check:"CheckInstallMongoDBsuccess";
Filename: "{cmd}"; Parameters: "/C ""sc config MongoDB displayname= ""MongoDB Server"""""; Flags: nowait skipifsilent; Check:"CheckInstallMongoDBsuccess"; 
Filename: "{cmd}"; Parameters: "/C ""sc description MongoDB ""MongoDB Database Server"""""; Flags: waituntilterminated skipifsilent; Components:MongoDB; Check:"CheckInstallMongoDBsuccess";

//
Filename:"msiexec.exe"; Parameters:" /qn /i ""{tmp}\fep.msi"" ";  WorkingDir: {tmp}; Components:FEP; Flags: waituntilterminated  runascurrentuser ; StatusMsg: "Installing FEP ...";
Filename:"msiexec.exe"; Parameters:" /qn /i ""{tmp}\dataserver.msi"" ";WorkingDir: {tmp}; Components:Data\DataServer;   Flags: waituntilterminated  runascurrentuser; StatusMsg: "Installing Data Server..."; 
Filename:"msiexec.exe"; Parameters:" /qn /i ""{tmp}\dataeditor.msi"" ";WorkingDir: {tmp}; Components:Data\DE;   Flags: waituntilterminated  runascurrentuser;  StatusMsg: "Installing Data Editor..."; 
Filename:"{app}\{#App_HMIName}";  Parameters:" /VERYSILENT  /NORESTART ";Components:SmartHMI; Flags: waituntilterminated  runascurrentuser; StatusMsg: "Installing Smart HMI ...";
Filename:"msiexec.exe"; Parameters:" /qn /i ""{tmp}\SmartHis.msi"" ADDLOCAL=""{code:GetStringInfoHisSetup}"" "; WorkingDir: {tmp}; Components: HIS\HisServer HIS\AdminTools HIS\DataLink HIS\ODBCDriver HIS\WebService HIS\ReportViewer HIS\DataClient;  Flags:waituntilterminated; StatusMsg: "Installing Smart His ..."; 
Filename:"msiexec.exe"; Parameters:" /qn /i ""{tmp}\PINS.msi"" ";   WorkingDir: {tmp}; Components:third_party\PiNS; Flags: waituntilterminated  runascurrentuser ; StatusMsg: "Installing Pi Network Subsystem..."; 
Filename:"msiexec.exe"; Parameters:" /qn /i ""{tmp}\PiSDK.msi"" ";  WorkingDir: {tmp}; Components:third_party\PiSDK; Flags: waituntilterminated  runascurrentuser ; StatusMsg: "Installing Pi SDK ..."; 
Filename:"{app}\VC_redist.x64.exe"; Parameters:" /QUIET /NORESTART"; Components:third_party\VCRedistributable; Flags: waituntilterminated;    StatusMsg: "Installing Visual redistributable 2015-2019 ..."; 
Filename:"{app}\VC_redist.x86.exe"; Parameters:" /QUIET /NORESTART"; Components:third_party\VCRedistributable; Flags: waituntilterminated;  StatusMsg: "Installing Visual redistributable 2015-2019 ..."; 
Filename:"msiexec.exe"; Parameters:" /qb- /i ""{tmp}\OpcRedistributablex64.msi""";  WorkingDir: {tmp}; Components:third_party\OpcCore; Flags: waituntilterminated  runascurrentuser ; StatusMsg: "Installing OPC Redistributables ...";  Check:"IsWin64";
Filename:"msiexec.exe"; Parameters:" /qb- /i ""{tmp}\OpcRedistributablex86.msi""";  WorkingDir: {tmp}; Components:third_party\OpcCore; Flags: waituntilterminated  runascurrentuser ; StatusMsg: "Installing OPC Redistributables ...";  Check:"not IsWin64";

;Windows service ultility
//Filename: "{cmd}"; Parameters: "/C ""sc config OADataServer displayname= ""OneATS Data Server""";  StatusMsg: "Installing OADataServer. Please wait...";Flags: nowait skipifsilent; Check:"IsDataServerChecked";      
//Filename: "{cmd}"; Parameters: "/C ""sc description OADataServer  ""OneATS Real-time Data Processing"""; Flags: nowait skipifsilent; Check:"IsDataServerChecked";  
//Filename: "{cmd}"; Parameters: "/C ""sc start OADataServer"""; StatusMsg: "Starting OADataServer ..."; Flags: nowait skipifsilent;   Check:"IsDataServerChecked";

//Filename: "{cmd}"; Parameters: "/C ""sc start OADatabaseService"""; Flags: nowait skipifsilent; Check:"CheckInstallMongoDBsuccess";  



[Code]                                                                                        
var       
  MongoDirPage : TInputQueryWizardPage;
  strMongoDataDir, strMongoLogDir: String;                                                                                  
    
  HISInformationPage: TInputFileWizardPage;   editHisSourceFile : TEdit;     
  
  idMongoExecutePage, idInitCustomPage : Integer;     

  InputFilePiNetworkSysPage: TInputFileWizardPage;   

  InputFilePiSDKPage: TInputFileWizardPage;
  
  InputFileVSRedistributalePage: TInputFileWizardPage;  
  
  LicenseMongoDBPage: TOutputMsgMemoWizardPage;
  RadioButtonAcceptMongoDBLicense : TRadioButton; 
  RadioButtonNOAcceptMongoDBLicense : TRadioButton;  
    
  //isVSRedisChecked, isDSChecked, isDEChecked, isHMIChecked, isFepChecked: Boolean;
  //isHISSmartHisChecked, isHISServerChecked, isHISDataLinkChecked, isHISODBCChecked, isHISWebServiceChecked, isHISReportViewerChecked : Boolean;

  RadioButtons: array[0..1] of TNewRadioButton;  
  ListMongoDBInstalled :  TArrayOfString;     
    
  StartTick: DWORD;  LastUpdate: DWORD;
  PercentLabel: TNewStaticText;
  ElapsedLabel: TNewStaticText;
  //RemainingLabel: TNewStaticText;

  // version string variable
  verFep, verDS, verDE, verHMI, verHis : String;   
  
  // for HIS featured setup
  infoHisSetup : String;       


// Version Utility
function CompareVersion(V1, V2: string): Integer;
var
  P, N1, N2: Integer;
begin
  Result := 0;
  while (Result = 0) and ((V1 <> '') or (V2 <> '')) do
  begin
    P := Pos('.', V1);
    if P > 0 then
    begin
      N1 := StrToInt(Copy(V1, 1, P - 1));
      Delete(V1, 1, P);
    end
      else
    if V1 <> '' then
    begin
      N1 := StrToInt(V1);
      V1 := '';
    end
      else
    begin
      N1 := 0;
    end;
  
    P := Pos('.', V2);
    if P > 0 then
    begin
      N2 := StrToInt(Copy(V2, 1, P - 1));
      Delete(V2, 1, P);
    end
      else
    if V2 <> '' then
    begin
      N2 := StrToInt(V2);
      V2 := '';
    end
      else
    begin
      N2 := 0;
    end;

    if N1 < N2 then Result := -1
      else
    if N1 > N2 then Result := 1;
  end;
end;

procedure GetVersionInRegistry();
var
  subPath : String;
begin
  subPath := ExpandConstant('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\');

  verHMI := '0.0';               
  if not RegQueryStringValue(HKLM, subPath + 'OneATS SmartHMI_is1', 'DisplayVersion', verHMI) then
        RegQueryStringValue(HKCU, subPath, 'VersionNumber', verHMI);     

end;
                                                                                        
function TicksToStr(Value: DWORD): string;
var
  I: DWORD;
  Hours, Minutes, Seconds: Integer;
begin
  I := Value div 1000;
  Seconds := I mod 60;
  I := I div 60;
  Minutes := I mod 60;
  I := I div 60;
  Hours := I mod 24;
  Result := Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds]);
end; 

function  IsDataServerChecked :Boolean;
begin
    Result := False;
    if(WizardIsComponentSelected('Data\DataServer') = True) then
      Result := True;    
end; 
function  IsHISServer(value: String) : String;
begin
    Result := '0';
    if(WizardIsComponentSelected('HIS\HisServer') = True) then
      Result := '1';    
end; 
function  IsHISSmartHis(value: String) : String;
begin
    Result := '0';
    if(WizardIsComponentSelected('HIS\SmartHis') = True) then
      Result := '1';    
end; 
function  IsHISDataLink(value: String) :String;
begin
    Result := '0';
    if(WizardIsComponentSelected('HIS\DataLink') = True) then
     Result := '1';   
end; 
function  IsHISODBC(value: String) :String;
begin
    Result := '0';
    if(WizardIsComponentSelected('HIS\ODBCDriver') = True) then
      Result := '1';  
end; 
function  IsHISWebService(value: String) :String;
begin
    Result := '0';
    if(WizardIsComponentSelected('HIS\WebService') = True) then
      Result := '1';    
end; 
function  IsHISReportViewer(value: String) :String;
begin
    Result := '0';
    if(WizardIsComponentSelected('HIS\ReportViewer') = True) then
      Result := '1';  
end; 

function GetStringInfoHisSetup(value: string) : string;
var char : String;
begin     
   char := ',';
   if(WizardIsComponentSelected('HIS\HisServer') = True) then
     infoHisSetup := infoHisSetup + 'ServerFeature';
   if(WizardIsComponentSelected('HIS\AdminTools') = True) then
     infoHisSetup := infoHisSetup + ',AdminToolFeature';
   if(WizardIsComponentSelected('HIS\DataLink') = True) then
     infoHisSetup := infoHisSetup + ',DataLinkFeature';
   if(WizardIsComponentSelected('HIS\ODBCDriver') = True) then
     infoHisSetup := infoHisSetup +  ',ODBCDriverFeature';
    if(WizardIsComponentSelected('HIS\WebService') = True) then
     infoHisSetup := infoHisSetup +  ',WebServiceFeature';
    if(WizardIsComponentSelected('HIS\ReportViewer') = True) then
      infoHisSetup := infoHisSetup + ',ReportViewerFeature';
     if(WizardIsComponentSelected('HIS\DataClient') = True) then
      infoHisSetup := infoHisSetup + ',DataClientFeature';
   //if(IsHISDataClient)
   //   infoHisSetup += 'DataClientFeature';     

   if(Pos(',', infoHisSetup)=1) then     
      Delete(infoHisSetup, 1, 1);
   
   Result := infoHisSetup;

end;

function GetComputerName(Value: string): string;
begin
  Result := GetComputerNameString + '.' + GetEnv('UserDnsDomain');
end;

function GetMongoDataDir(Value: string): string;
begin
  Result := strMongoDataDir;  
end;

function GetMongoLogDir(Value: string): string;
begin
  Result := strMongoLogDir;    
end;
function GetCompany(Value: string): string;
begin
  Result :='';// PageHMIInfo.Values[1];
end;   
function GetListSubKeyMongoDB() : TArrayOfString;
var
  arr : TArrayOfString;
begin
  RegGetSubkeyNames(HKEY_LOCAL_MACHINE, 'SOFTWARE\MongoDB\Server', arr);
  RegGetSubkeyNames(HKEY_CURRENT_USER, 'SOFTWARE\MongoDB\Server', arr);  
  Result := arr;
end;

function CheckInstallMongoDBsuccess() : Boolean;
var   
  i : Integer;
begin
  Result := false;
  RegGetSubkeyNames(HKEY_LOCAL_MACHINE, 'SOFTWARE\MongoDB\Server', ListMongoDBInstalled);
  For i:= 0 to (Length(ListMongoDBInstalled) -1) do
    if ((WizardIsComponentSelected('MongoDB')) and( ListMongoDBInstalled[i] = '4.2')) then
        Result := True;    
end;

function CheckExistApplication(appname : String) : Boolean;
var
  isExist : Boolean;
  subPath, strVersion: String;
  S: String; I: Integer;
begin
    Result := False;
    if (appName = 'PiNS') then
    begin
       subPath := ExpandConstant('SOFTWARE\PISystem\PINS');
       //subPath := ExpandConstant('WOW6432Node\PISystem\PINS');
       strVersion := '';
      if not RegQueryStringValue(HKLM, subPath, 'VersionNumber', strVersion) then
        RegQueryStringValue(HKCU, subPath, 'VersionNumber', strVersion);
      if(strVersion <> '') then
      begin
        if SuppressibleMsgBox('PiNS is already installed. Do you want to cancel setup PiNS?', mbConfirmation, MB_YESNO, IDNO) = IDYES then
          Result := True;
      end;
    end;
    
    if (appName = 'VSRedistributable') then
    begin
     if(IsWin64) then
       subPath := ExpandConstant('SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x64');
     if(not IsWin64 ) then
       subPath := ExpandConstant('SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x86');
       
     strVersion := '';
     if not RegQueryStringValue(HKLM, subPath, 'Version', strVersion) then
        RegQueryStringValue(HKCU, subPath, 'Version', strVersion);
     if(strVersion <> '') then
      begin
        if SuppressibleMsgBox('VS C++ Redistributable 2015-2019 is already installed. Do you want to cancel setup ?', mbConfirmation, MB_YESNO, IDNO) = IDYES then
          Result := True;
      end;
    end;                   
    
    if(appName='MongoDB') then
    begin         
       RegGetSubkeyNames(HKEY_LOCAL_MACHINE, 'SOFTWARE\MongoDB\Server', ListMongoDBInstalled);
       RegGetSubkeyNames(HKEY_CURRENT_USER, 'SOFTWARE\MongoDB\Server', ListMongoDBInstalled);    
       
       if(GetArrayLength(ListMongoDBInstalled) >0) then
       begin          
          Result := True;
       end;
    end;    
end;

function PrepareToInstall(var NeedsRestart: Boolean): string;  
begin    
  Result := '';     //continue install normally
end;     

function GetTickCount: DWORD;
  external 'GetTickCount@kernel32.dll stdcall';
// Progress Utility  
procedure SetProgress(Position: Integer);
begin
  WizardForm.ProgressGauge.Position :=  Position * WizardForm.ProgressGauge.Max div 100;
end;
procedure SetMarqueeProgress(Marquee: Boolean);
begin
  if Marquee then
  begin
    WizardForm.ProgressGauge.Style := npbstMarquee;
  end
    else
  begin
    WizardForm.ProgressGauge.Style := npbstNormal;
  end;
end;
procedure FilePageEditChange(Sender: TObject);
begin
  WizardForm.NextButton.Enabled := (Length(TEdit(Sender).Text) > 0);
end;        
procedure FilePageActivate(Sender: TWizardPage);
begin
  FilePageEditChange(TInputFileWizardPage(Sender).Edits[0]);
end;  

procedure ShiftFilePageItem(Page: TInputFileWizardPage; Index: Integer; Offset: Integer);
begin
  Page.Edits[Index].Top := Page.Edits[Index].Top + Offset;
  Page.Buttons[Index].Top := Page.Buttons[Index].Top + Offset;
  Page.PromptLabels[Index].Top := Page.PromptLabels[Index].Top + Offset;
end;

procedure SetFilePageItemEnabled(Page: TInputFileWizardPage; Index: Integer; Enabled: Boolean);
begin
  //Page.Edits[Index].Text := '';
  Page.Edits[Index].Enabled := Enabled;
  Page.Buttons[Index].Enabled := Enabled;
  Page.PromptLabels[Index].Enabled := Enabled;
end;   
procedure FreeNil(aIndex:Integer; arr:TArrayOfString);
var
     vItem:TObject;
begin
     vItem := arr[aIndex];
     vItem := nil;
     vItem.Free;
end;
procedure ClearTArrayOfString( arr :TArrayOfString);
var
  vCntr:Integer;
begin
  For vCntr:= 0 to Length(arr) do
    FreeNil(vCntr, arr);
end;  

procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', 'https://www.mongodb.com/licensing/server-side-public-license', '', '',  SW_SHOW, ewWaitUntilTerminated, ErrorCode);
end;

{Download Page utility}
function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  if Progress = ProgressMax then
    Log(Format('Successfully downloaded file to {tmp}: %s', [FileName]));
  Result := True;
end;    

{License MongoDB utility}
procedure CheckLicenseMongoDBAccepted(Sender: TObject);
begin
  // Update Next button when user (un)accepts the license
  WizardForm.NextButton.Enabled := RadioButtonAcceptMongoDBLicense.Checked;
end;                         

function CloneLicenseRadioButton(Source: TRadioButton): TRadioButton;
begin
  Result := TRadioButton.Create(WizardForm);
  Result.Parent := LicenseMongoDBPage.Surface;
  Result.Caption := Source.Caption;
  Result.Left := Source.Left;
  Result.Top := Source.Top;
  Result.Width := Source.Width;
  Result.Height := Source.Height;
  // Needed for WizardStyle=modern / WizardResizable=yes
  Result.Anchors := Source.Anchors;
  Result.OnClick := @CheckLicenseMongoDBAccepted;
end;
                      
function IsMongoDataDirEmpty(): Boolean;
var
  dirName :String;
  FindRec: TFindRec;
  FileCount: Integer;
begin
  Result := False;
  dirName :=  GetMongoDataDir('');
  if FindFirst(dirName+'\*', FindRec) then begin
    try
      repeat
        if (FindRec.Name <> '.') and (FindRec.Name <> '..') then begin
          FileCount := 1;
          break;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
      if FileCount = 0 then Result := True;
      if FileCount > 0 then 
      begin                        
       Result :=  DelTree(dirName +'\*', False, True, True);            
      end;             
    end;
  end;
end;       


procedure InitializeWizard();
var
  LicenseFileName: string;
  LicenseFilePath: string;
  URLLabelMongoLicense :TNewStaticText;
begin       
   
  GetVersionInRegistry();            

  WizardForm.ComponentsDiskSpaceLabel.Visible := False;
    
  //CreateInputSourceModuleFilePage(wpWelcome);           
  //AddSourceModulePathToSelectDirpage();      

  idMongoExecutePage := wpSelectTasks;
  //Create MongoDB Directory     
  MongoDirPage := CreateInputQueryPage(idMongoExecutePage, 'OneATS Database Directory', 'Data folder and log folder of MongoDB Service', ''); 
  MongoDirPage.Add('&Data Directory:', False);  
  MongoDirPage.Add('&Log Directory:', False);         
  MongoDirPage.Values[0] := ExpandConstant('{#App_Mongo4_2Dir}\data');
  MongoDirPage.Values[1] := ExpandConstant('{#App_Mongo4_2Dir}\log');    


  idMongoExecutePage := MongoDirPage.ID;

  idInitCustomPage :=  idMongoExecutePage;      
                                       


  LicenseMongoDBPage := CreateOutputMsgMemoPage(
      idMongoExecutePage, 'MongoDB License Agreement', 'Reference from: https://www.mongodb.com/licensing/server-side-public-license',SetupMessage(msgLicenseLabel3),'');
  idMongoExecutePage := LicenseMongoDBPage.ID;
  // Shrink license box to make space for radio buttons
  LicenseMongoDBPage.RichEditViewer.Height := WizardForm.LicenseMemo.Height-11;
  LicenseFileName := ExpandConstant('MongoDBLicense.txt');
  ExtractTemporaryFile(LicenseFileName);
  LicenseFilePath := ExpandConstant('{tmp}\' + LicenseFileName);   
  LicenseMongoDBPage.RichEditViewer.Lines.LoadFromFile(LicenseFilePath);
  DeleteFile(LicenseFilePath);
  // Clone accept/do not accept radio buttons for the second license
  RadioButtonAcceptMongoDBLicense := CloneLicenseRadioButton(WizardForm.LicenseAcceptedRadio);
  RadioButtonNOAcceptMongoDBLicense :=  CloneLicenseRadioButton(WizardForm.LicenseNotAcceptedRadio); 
  // Initially not accepted
  RadioButtonAcceptMongoDBLicense.Checked := True;
                                                                 
  URLLabelMongoLicense := TNewStaticText.Create(WizardForm);
  URLLabelMongoLicense.Caption := 'https://www.mongodb.com/licensing/server-side-public-license';
  URLLabelMongoLicense.Cursor := crHand;
  URLLabelMongoLicense.OnClick := @URLLabelOnClick;
  //URLLabelMongoLicense.Parent := LicenseMongoDBPage.Surface;
  { Alter Font *after* setting Parent so the correct defaults are inherited first }
  URLLabelMongoLicense.Font.Style := URLLabelMongoLicense.Font.Style + [fsUnderline];
  URLLabelMongoLicense.Font.Color := clBlue;
  URLLabelMongoLicense.Top := 249;
  URLLabelMongoLicense.Left := 0;

  //Utility foe time remaing, progress  
  PercentLabel := TNewStaticText.Create(WizardForm);
  PercentLabel.Parent := WizardForm.ProgressGauge.Parent;
  PercentLabel.Left := 0;
  PercentLabel.Top := WizardForm.ProgressGauge.Top +
  WizardForm.ProgressGauge.Height + 12;

  ElapsedLabel := TNewStaticText.Create(WizardForm);
  ElapsedLabel.Parent := WizardForm.ProgressGauge.Parent;
  ElapsedLabel.Left := 0;
  ElapsedLabel.Top := PercentLabel.Top + PercentLabel.Height + 4;

  //RemainingLabel := TNewStaticText.Create(WizardForm);
  //RemainingLabel.Parent := WizardForm.ProgressGauge.Parent;
  //RemainingLabel.Left := 0;
  //RemainingLabel.Top := ElapsedLabel.Top + ElapsedLabel.Height + 4;
  
end;

procedure CurPageChanged(CurPageID: Integer);
begin      
  if CurPageID = LicenseMongoDBPage.ID then
  begin
    CheckLicenseMongoDBAccepted(nil);    
  end;              
  
  if CurPageID = wpInstalling then
    StartTick := GetTickCount;

end;                

// For visible or hiden page, return true = hiden  
function ShouldSkipPage(PageID: Integer): Boolean;
begin
   Result := False;   
   if((PageID =  MongoDirPage.ID) and (not WizardIsComponentSelected('MongoDB'))) then
      Result := True;
   if ((PageID = LicenseMongoDBPage.ID) and (not WizardIsComponentSelected('MongoDB'))) then
      Result := True;   
   if (PageID = wpSelectDir) then
      Result := True;        
                                      
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var 
  arrMongoDB : TArrayOfString;
  strMongoDBVersions : String; i, ret: Integer;
begin
  Result := True;

  if CurPageID = wpSelectComponents then
  begin
     if(WizardIsComponentSelected('MongoDB')) then
     begin
          arrMongoDB := GetListSubKeyMongoDB();
          if(GetArrayLength(arrMongoDB) > 0) then
          begin 
            strMongoDBVersions := '';
            for i := 0 to GetArrayLength(arrMongoDB)-1 do
            strMongoDBVersions := strMongoDBVersions + arrMongoDB[i] + #13#10; 
            ret :=   MsgBox('Exist MongoDB Instance version: ' + strMongoDBVersions +#13#10#13#10 'Please uninstall old version before install application!' + #13#10 'Try to install this?', mbInformation, MB_YESNO)              
            if(ret= IDNO) then     
            begin
               Result := False;                          
            end;

            if(ret = IDYES) then
              Result := True;
                             
          end;
     end;

      if(WizardIsComponentSelected('SmartHMI') = True) then
      begin
          GetVersionInRegistry();
          
          Log('MODULE VERSION(precompile): ' + ExpandConstant('{#App_HMIVersion}'));
          Log('REGISTRY VERSION: ' +verHMI);
          if(CompareVersion(ExpandConstant('{#App_HMIVersion}'), verHMI) < 1) then
          begin
            MsgBox('You already installed current or newer  HMI version', mbInformation, MB_OK);
            Result := False;
          end;

      end;


  end;  
 
  if CurPageID = MongoDirPage.ID then
  begin
     strMongoDataDir := MongoDirPage.Values[0];
     strMongoLogDir := MongoDirPage.Values[1];
  end;

end;
                
procedure CurStepChanged(CurStep: TSetupStep);
var
  iResultCode : Integer;
begin
  if CurStep = ssDone then
  begin
    // uninstall file OneATSSetup
    //Filename: "{app}\unins000.exe" ; Parameters:" /VERYSILENT  /NORESTART";  Flags: nowait  skipifsilent;
    if Exec(ExpandConstant('{app}\unins000.exe'), '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES','', SW_HIDE, ewWaitUntilTerminated, iResultCode) then
    begin
    end;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID = wpInstalling then
  begin
    Cancel := False;
    if ExitSetupMsgBox then
    begin
      Cancel := True;
      Confirm := False;
      PercentLabel.Visible := False;
      ElapsedLabel.Visible := False;
      //RemainingLabel.Visible := False;
    end;
  end;
end;


procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
var
  CurTick: DWORD;
begin
  CurTick := GetTickCount;
  PercentLabel.Caption :=
    Format('Done: %.2f %%', [(CurProgress * 100.0) / MaxProgress]);
  ElapsedLabel.Caption := 
    Format('Elapsed: %s', [TicksToStr(CurTick - StartTick)]);
  if CurProgress > 0 then
  begin
    //RemainingLabel.Caption :=
    //  Format('Remaining: %s', [TicksToStr(
    //    ((CurTick - StartTick) / CurProgress) * (MaxProgress - CurProgress))]);
  end;
end;





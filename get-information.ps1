'#######Windows 情報取得######'
'===ベンダー名==='
wmic csproduct get vendor
'===シリアルナンバー==='
wmic bios get serialnumber
'===ホスト名==='
hostname
'===IP==='
ipconfig /all
'===CPU型番 / CPU数 / コア数 / CPU==='
Get-WmiObject -Class Win32_Processor | FL Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed
'===メモリ量==='
((Get-WmiObject -Class Win32_physicalMemory).capacity /1024/1024/1024).toString() + " GB"
'===HD容量==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace
'===パーティション構成==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace
'===RAID構成==='
'===OS名 / OS Version==='
Get-WmiObject -Class Win32_OperatingSystem | Format-List Caption, csdversion, OSArchitecture, BuildNumber, countrycode, Locale, MUILanguages, Organization

'===導入SW==='
get-windowsfeature
get-wmiobject -class win32_product | format-list Name, Vendor, Version
'===保守満了時期==='
cscript.exe C:\windows\System32\slmgr.vbs /dlv

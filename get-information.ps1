'#######Windows Server Informations######'
Param($csvpath)
'===Vendor Name==='
wmic csproduct get vendor | export-csv $csvpath -notype
'===Serial Number==='
wmic bios get serialnumber | export-csv $csvpath -notype
'===Hostname==='
hostname
'===IP address==='
ipconfig /all
'===CPU Model / Number of CPUs / Number of Core/ CPU Clock Speed ==='
Get-WmiObject -Class Win32_Processor | FL Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed
'===Memory amount==='
((Get-WmiObject -Class Win32_physicalMemory).capacity /1024/1024/1024).toString() + " GB"
'===Disk Info==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace
'===Partition Info==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace
'===OS name / OS Version==='
Get-WmiObject -Class Win32_OperatingSystem | Format-List Caption, csdversion, OSArchitecture, BuildNumber, countrycode, Locale, MUILanguages, Organization

'===SW Information==='
get-windowsfeature
get-wmiobject -class win32_product | format-list Name, Vendor, Version
'===License Information==='
cscript.exe C:\windows\System32\slmgr.vbs /dlv

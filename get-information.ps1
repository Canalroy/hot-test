'#######Windows Server Informations######'

'===Vendor Name==='
wmic csproduct get vendor >> C:\Windows\Temp\windows_info.csv 
'===Serial Number==='
wmic bios get serialnumber  >> C:\Windows\Temp\windows_info.csv 
'===Hostname==='
hostname  >> C:\Windows\Temp\windows_info.csv 
'===IP address==='
ipconfig /all  >> C:\Windows\Temp\windows_info.csv 
'===CPU Model / Number of CPUs / Number of Core/ CPU Clock Speed ==='
Get-WmiObject -Class Win32_Processor 
'===Memory amount==='
((Get-WmiObject -Class Win32_physicalMemory).capacity /1024/1024/1024).toString() + " GB" >> C:\Windows\Temp\windows_info.csv 
'===Disk Info==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace >> C:\Windows\Temp\windows_info.csv 
'===Partition Info==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace >> C:\Windows\Temp\windows_info.csv 
'===OS name / OS Version==='
Get-WmiObject -Class Win32_OperatingSystem | Format-List Caption, csdversion, OSArchitecture, BuildNumber, countrycode, Locale, MUILanguages, Organization >> C:\Windows\Temp\windows_info.csv 

'===SW Information==='
get-windowsfeature >> C:\Windows\Temp\windows_info.csv 
get-wmiobject -class win32_product | format-list Name, Vendor, Version >> C:\Windows\Temp\windows_info.csv 
'===License Information==='
cscript.exe C:\windows\System32\slmgr.vbs /dlv >> C:\Windows\Temp\windows_info.csv 

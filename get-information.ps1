'#######Windows Server Informations######'

'===Vendor Name==='
wmic csproduct get vendor | export-csv C:\Windows\Temp\windows_info.csv 
'===Serial Number==='
wmic bios get serialnumber | export-csv C:\Windows\Temp\windows_info.csv
'===Hostname==='
hostname | export-csv C:\Windows\Temp\windows_info.csv
'===IP address==='
ipconfig /all | export-csv C:\Windows\Temp\windows_info.csv
'===CPU Model / Number of CPUs / Number of Core/ CPU Clock Speed ==='
Get-WmiObject -Class Win32_Processor | FL Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed | export-csv C:\Windows\Temp\windows_info.csv
'===Memory amount==='
((Get-WmiObject -Class Win32_physicalMemory).capacity /1024/1024/1024).toString() + " GB" | export-csv C:\Windows\Temp\windows_info.csv
'===Disk Info==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace | export-csv C:\Windows\Temp\windows_info.csv
'===Partition Info==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace | export-csv C:\Windows\Temp\windows_info.csv
'===OS name / OS Version==='
Get-WmiObject -Class Win32_OperatingSystem | Format-List Caption, csdversion, OSArchitecture, BuildNumber, countrycode, Locale, MUILanguages, Organization | export-csv C:\Windows\Temp\windows_info.csv

'===SW Information==='
get-windowsfeature | export-csv C:\Windows\Temp\windows_info.csv
get-wmiobject -class win32_product | format-list Name, Vendor, Version | export-csv C:\Windows\Temp\windows_info.csv
'===License Information==='
cscript.exe C:\windows\System32\slmgr.vbs /dlv | export-csv C:\Windows\Temp\windows_info.csv

'#######Windows ���擾######'
'===�x���_�[��==='
wmic csproduct get vendor
'===�V���A���i���o�[==='
wmic bios get serialnumber
'===�z�X�g��==='
hostname
'===IP==='
ipconfig /all
'===CPU�^�� / CPU�� / �R�A�� / CPU==='
Get-WmiObject -Class Win32_Processor | FL Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed
'===��������==='
((Get-WmiObject -Class Win32_physicalMemory).capacity /1024/1024/1024).toString() + " GB"
'===HD�e��==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace
'===�p�[�e�B�V�����\��==='
Get-WmiObject Win32_LogicalDisk | format-list DeviceID, Name, VolumeName, DeviceType, Filesystem, ProviderName, Size, FreeSpace
'===RAID�\��==='
'===OS�� / OS Version==='
Get-WmiObject -Class Win32_OperatingSystem | Format-List Caption, csdversion, OSArchitecture, BuildNumber, countrycode, Locale, MUILanguages, Organization

'===����SW==='
get-windowsfeature
get-wmiobject -class win32_product | format-list Name, Vendor, Version
'===�ێ疞������==='
cscript.exe C:\windows\System32\slmgr.vbs /dlv

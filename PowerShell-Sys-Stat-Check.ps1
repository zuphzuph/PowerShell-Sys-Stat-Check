#Get users that exist on System
net user
#Get IPv4 Address
Test-Connection -ComputerName $env:computername -count 1
write-host ""
#Check Event Logs
#Get-EventLog -AsString <-- List log types within Event Viewer on System
Get-WinEvent -FilterHashtable @{Logname='Security'}  -MaxEvents 1
#Get Windows Version
write-host ""
(Get-WmiObject Win32_OperatingSystem).Version
#Check for Windows Updates
Get-HotFix -Description Security*
#Get-HotFix -Description KB####### <-- Uncomment to target KB Package
#Check Process Status
if((get-process "chrome" -ea SilentlyContinue) -eq $Null){ 
    echo "Chrome isn't running." 
}
else{ 
    echo "Chrome is running."
}

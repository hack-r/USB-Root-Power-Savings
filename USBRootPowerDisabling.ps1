#--Name: USB Root Power Disabling
#--Copyleft: Miller Intelligence, LLC
#--First Author: Dallas R. Smith, MBA, BACS, BBA
#--Second Author: Jason D. Miller, MS, MS

# To do: sign the script

$hubs = Get-WmiObject Win32_USBHub
$powerMgmt = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | where {$_.InstanceName.Contains($hubs.PNPID)}
foreach ($p in $powerMgmt)
{
  $p.Enable = $False
  $p.psbase.Put()
}
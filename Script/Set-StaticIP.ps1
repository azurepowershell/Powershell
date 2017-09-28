$ipaddress = "182.168.0.255"
$ipprefix = "24"
$ipgw = "192.168.0.1"
$ipdns = "192.168.0.1"
$ipif = (Get-NetAdapter).ifIndex

New-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix -InterfaceIndex $ipif -DefaultGateway -$ipgw
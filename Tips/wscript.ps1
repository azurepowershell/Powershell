
$wshnetwork = New-Object -ComObject "wscript.network"
$colprinters = $wshnetwork.EnumPrinterConnections()
$colDrives = $wshnetwork.EnumNetworkDrives()
$username = $wshnetwork.UserDomain
$username = $wshnetwork.UserName
$userDomain= $wshnetwork.UserDomain
$computername = $wshnetwork.ComputerName
$wshshell = New-Object -ComObject "wscript.shell"
$wshshell.Popup($userDomain+"\$username on $computername")
$wshshell.Popup($colprinters)
$wshshell.Popup($colDrives)

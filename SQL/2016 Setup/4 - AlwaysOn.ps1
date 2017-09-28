#Kjøres på hver server

#Enable always on
Import-Module SQLPS

$computer = $env:COMPUTERNAME
$instance = 'default'
$path = ("SQLSERVER:\SQL\" + $computer + "\" + $instance)



Enable-SqlAlwaysOn -Path $path -Force




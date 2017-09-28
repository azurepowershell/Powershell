Set-Location C:\NanoServerImageGenerator
Import-Module .\NanoServerImageGenerator -Verbose


$pwd = ConvertTo-SecureString -AsPlainText -Force -String 'Password99'

1..3 | % {
    New-NanoServerImage -MediaPath d:\ -TargetPath "c:\VM\nano-hc-0$_\nano-hc-0$_.vhd" -DeploymentType Guest -Edition Datacenter `    -ComputerName "Nano-HC-0$_" -AdministratorPassword $pwd `    -InterfaceNameOrIndex Ethernet -Ipv4Address "10.0.10.10$_" -Ipv4SubnetMask 255.255.255.0 -Ipv4Dns 10.0.10.10 `    -Storage -Clustering -Compute -EnableRemoteManagementPort    }    New-NanoServerImage -MediaPath f:\ -TargetPath "c:\VM\nano-iis.vhd" -DeploymentType Guest -Edition Datacenter `    -ComputerName "Nano-IIS" -AdministratorPassword $pwd `    -InterfaceNameOrIndex Ethernet -Ipv4Address "10.0.10.110" -Ipv4SubnetMask 255.255.255.0 -Ipv4Dns 10.0.10.10 `    -Packages Microsoft-NanoServer-IIS-Package
1..3 | % {    New-NanoServerImage -MediaPath D:\ -TargetPath c:\vm\Nano$_\Nano$_.wim -OEMDrivers -ComputerName Nano$_ `    -Packages Microsoft-NanoServer-SCVMM-Package,Microsoft-NanoServer-SCVMM-Compute-Package `    -AdministratorPassword $pwd -Edition Datacenter `    -InterfaceNameOrIndex Ethernet -Ipv4Address "10.0.10.10$_" -Ipv4SubnetMask 255.255.255.0 -Ipv4Dns 10.0.10.10 `    -Storage -Clustering -EnableRemoteManagementPort -DeploymentType Host    }    Set-DnsClientServerAddress -InterfaceAlias Ethernet0 -ServerAddresses ("10.0.10.10")
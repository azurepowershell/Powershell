New-Cluster -Name S2D -Node nano1, nano-hc-02, nano-hc-03 -StaticAddress 10.0.10.100 -NoStorage

Set-ClusterQuorum -Cluster S2D -FileShareWitness \\dc1\S2DHCWitness

Enable-ClusterS2D -CimSession S2D -Autoconfig $false -SkipEligibilityChecks -CacheMode Disabled

Get-StorageProvider | Register-StorageSubsystem -ComputerName S2D

$disk = Get-StorageSubSystem -FriendlyName *S2D* | Get-PhysicalDisk -CanPool $true


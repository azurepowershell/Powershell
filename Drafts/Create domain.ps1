#
# Windows PowerShell script for AD DS Deployment
#

Import-Module -Name ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath 'C:\Windows\NTDS' `
-DomainMode 'Win2012' `
-DomainName 'domain.lab' `
-DomainNetbiosName 'DOMAIN' `
-ForestMode 'Win2012' `
-InstallDns:$true `
-LogPath 'C:\Windows\NTDS' `
-NoRebootOnCompletion:$false `
-SysvolPath 'C:\Windows\SYSVOL' `
-Force:$true


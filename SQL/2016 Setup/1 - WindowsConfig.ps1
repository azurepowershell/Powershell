#Har satt NAVN, IP osv manuelt da dette skulle ha vært gjort gjennom CM :(:(


#Kjøres på hver Server med OS disk mounted
Install-WindowsFeature -Name Server-Gui-Mgmt-Infra -Source wim:d:\sources\install.wim:4 

#Installere CM Clienten
#Installere SQL Managemet fra CM
#Installere Appassure
#Installere Windows Framework 5

#DC
New-ADServiceAccount -Name SA_SQL_MON-DB15 -DNSHostName SA_SQL_MON-DB15.montel.local -Enabled $true
Add-ADComputerServiceAccount -Identity MON-DB15 -ServiceAccount SA_SQL_MON-DB15
Set-ADServiceAccount -Identity SA_SQL_MON-DB15 -PrincipalsAllowedToRetrieveManagedPassword MON-DB15$

New-ADServiceAccount -Name SA_SQL_MON-DB16 -DNSHostName SA_SQL_MON-DB16.montel.local -Enabled $true
Add-ADComputerServiceAccount -Identity MON-DB16 -ServiceAccount SA_SQL_MON-DB16
Set-ADServiceAccount -Identity SA_SQL_MON-DB16 -PrincipalsAllowedToRetrieveManagedPassword MON-DB16$



#På hver node
Add-WindowsFeature RSAT-AD-PowerShell 
Import-Module ActiveDirectory

Install-ADServiceAccount -Identity SA_SQL_MON-DB15
Install-ADServiceAccount -Identity SA_SQL_MON-DB16
#Legge til SA brukeren som lokal admin
#Endre sqlserver og agent til SA bruker


#aktivere ipmonitor og backup
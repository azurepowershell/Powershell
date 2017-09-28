$OU = 'OU=Distribution Groups,OU=Montel,DC=montel,DC=local'

$groups = Get-ADGroup -Filter * -SearchBase $OU -Properties SamAccountName, ProxyAddresses

foreach($group in $groups)
{
    Set-ADGroup -Identity $group.SamAccountName -Add @{ProxyAddresses = 'smtp:'+ $group.SamAccountName + '@montelnews.com'}
}
 
#requires -Version 2.0 -Modules ActiveDirectory

#users

$searchBase = 'OU=AdminAndSales,OU=Users,OU=Montel,DC=montel,DC=local'
$domain = '@montelnews.com'


$users = Get-ADUser -Filter {
  name -like '*'
} -SearchBase $searchBase -Properties SamAccountName, EmailAddress, ProxyAddresses, GivenName, Surname



foreach ($user in $users)
{
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.SamAccountName.ToLower() + $domain
  }
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.GivenName.replace(' ','.').Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '.' +   $user.Surname.Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + $domain
  }
}

#grupper

$searchBase = 'OU=Distribution Groups,OU=Montel,DC=montel,DC=local'
$domain = '@montelnews.com'


$Groups = Get-ADGroup -Filter * -SearchBase $searchBase -Properties Name, ProxyAddresses


foreach ($Group in $Groups)
{
  Set-ADGroup -Identity $Group.Name -Add @{
    ProxyAddresses = 'smtp:'+ $Group.Name.ToLower().replace(' ','.') + $domain
  }
}



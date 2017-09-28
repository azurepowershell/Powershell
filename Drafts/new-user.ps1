#requires -Version 2.0 -Modules ActiveDirectory


$salesAndAdminOU = 'OU=AdminAndSales,OU=Users,OU=Montel,DC=montel,DC=local'
$newOU = 'OU=News Desk,OU=Users,OU=Montel,DC=montel,DC=local'
$fullName = 'Stian Kåre Nordmann'
$department = 'news'
$password = 'Welcome123!'
$changePasswordAtLogon = $true
$office = 'Oslo'
$title = 'Reporter'
$country = 'Norway'
$company = 'Montel'



# Split Full name
$numberOfNames = ($fullName | Measure-Object -Word).Words

if ($numberOfNames -gt 2)
{
  $firstName, $middleName, $lastName = $fullName.Split(' ',3)
}
else 
{
  $firstName, $lastName = $fullName.Split(' ',2)
}

 

# Create Username
$user = Get-ADUser $firstName -Properties samAccountName
if ($user.samAccountName -ne $firstName) 
{
  $username = $firstName.ToLower()
}
else 
{
  $username = $firstName + $lastName.Substring(0,1).toLower()
}


Write-Verbose "Username will be: $username"



<#


$firstName += ' ' + $middleName



New-ADUser -SamAccountName $fullName

















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



#>
$searchBase = 'OU=AdminAndSales,OU=Users,OU=Montel,DC=montel,DC=local'
$searchBase = 'OU=News desk,OU=Users,OU=Montel,DC=montel,DC=local'
$searchBase = 'OU=Users,OU=SoftwareScenario,DC=montel,DC=local'
$searchBase = 'OU=External Users,DC=montel,DC=local'


Get-ADUser -Filter {
  name -like '*'
} -SearchBase $searchBase -Properties passwordlastset, passwordneverexpires, LastLogonDate | sort passwordlastset | ft Name, passwordlastset, Passwordneverexpires, LastLogonDate

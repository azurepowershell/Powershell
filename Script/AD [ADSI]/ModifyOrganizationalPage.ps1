
$strDomain = "DC=Montel,DC=local"
$strOU = "OU=MyTestOU"
$strUser = "CN=MyTestUser"
$strManager = "CN=MyBoss"

$objUser = [ADSI]"LDAP://$strUser,$strOU,$strDomain"
$objUser.Put("title", "Mid-Level Manager")
$objUser.Put("department", "sales")
$objUser.Put("company", "Northwind Traders")
$objUser.Put("manager", "$strManager,$strOU,$strDomain")

$objUser.SetInfo()





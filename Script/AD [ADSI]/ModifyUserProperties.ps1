$objUser = [ADSI]"LDAP://CN=MyTestUser,OU=MyTestOU,DC=Montel,DC=local"
$objUser.Put("SamaccountName", "myNewUser")
$objUser.Put("givenName", "My")
$objUser.Put("initials", "N.")
$objUser.Put("sn", "User")
$objUser.Put("DisplayName", "My New User")
$objUser.Put("description", "simple new user")
$objUser.Put("physicalDeliveryOfficeName", "RQ2")
$objUser.Put("telephoneNumber", "555-555-0111")
$objUser.Put("otherTelephone",@("555-555-0112","555-555-0113"))
$objUser.Put("mail", "myuser@mwtraders.com")
$objUser.Put("wwwHomePage", "http://www.ScriptingGuys.com")
$objUser.Put("url",@("http://www.ScriptingGuys.com/blog","http://www.ScriptingGuys.com/LearnPowerShell"))
$objUser.SetInfo()












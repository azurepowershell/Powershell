$objUser = [ADSI]"LDAP://CN=MyTestUser,OU=MyTestOU,DC=Montel,DC=local"
$objUser.Put("profilePath", "\\London\Profiles\MyTestUser")
$objUser.Put("scriptPath", "logon.vbs")
$objUser.Put("homeDirectory", "\\London\Users\MyTestUser") #City
$objUser.Put("homeDrive", "H:")
$objUser.SetInfo()





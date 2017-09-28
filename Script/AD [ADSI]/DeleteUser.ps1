$strClass = "User"
$strName = "CN=MyUser"
$objADSI =[ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"
$ocjUser = $objADSI.Delete($strClass, $strName)

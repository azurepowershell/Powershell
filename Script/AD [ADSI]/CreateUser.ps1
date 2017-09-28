$strClass = "User"
$strName = "CN=MyTestUser"
$objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"
$objUser = $objADSI.Create($strClass, $strName)
$objUser.put("sAMAccountName", "MyTestUser")
$objUser.setInfo()

$strClass = "Computer"
$strOUName = "CN=MyTestComputer"
$objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"
$objComputer = $objADSI.Create($strClass, $strOUName)
$objComputer.put("sAMAccountName", "MyTestComputer")
$objComputer.setInfo()

#Set the account to trusted and do not require a password (not disabled)
$objComputer.Put("UserAccountControl",4128)
$objComputer.setInfo()

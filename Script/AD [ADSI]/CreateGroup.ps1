$intGroupType = 2
$strClass = "Group"
$strOUName = "CN=MyTestGroup"
$objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"
$objGroup = $objADSI.Create($strClass, $strOUName)
$objGroup.put("GroupType", $intGroupType)
$objGroup.setInfo()

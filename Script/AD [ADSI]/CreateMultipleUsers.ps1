$strClass = "User"
$aryNames = "CN=MyBoss", "CN=MyDirect1", "CN=MyDirect2"
$objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"

foreach($strName in $aryNames)
    {
        $objUser = $objADSI.Create($strClass, $strName)
        $objUser.setInfo()
    }

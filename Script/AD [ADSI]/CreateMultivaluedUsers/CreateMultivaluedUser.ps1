$aryText = Get-Content -Path ".\OneStepFurther.txt" 
$strClass = "User" 
$intUsers = 9
$strName = "cn=tempUser" 

$objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"
for ($i = 1; $i -le $intUsers; $i++)
    {
        $objUser = $objADSI.Create($strCLass, $StrName + $i)
        $objUser.setInfo()
        $objUser.Put("streetAddress", $aryText[0])
        $objUser.Put("postOfficeBox", $aryText[1])
        $objUser.Put("l", $aryText[2])
        $objUser.Put("st", $aryText[3])
        $objUser.Put("postalCode", $aryText[4])
        $objUser.Put("c", $aryText[5])
        $objUser.Put("co", $aryText[6])
        $objUser.Put("countryCode", $aryText[7])
        $objUser.Put("facsimileTelephoneNumber", $aryText[8])
        $objUser.Put("info", $aryText[9])
        $objUser.SetInfo()
    }
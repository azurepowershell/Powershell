$ErrorActionPreference = "SilentlyContinue"
$Error.Clear()

$strClass = "organizationalUnit"
$strOUName = "OU=MyTestOU"
$objADSI = [ADSI]"LDAP://DC=Montel,DC=local"
$objOU = $objADSI.Create($strClass, $strOUName)
$objOU.setInfo()


if ($Error.Count -ne 0) {
        "An error occoured during the operation. Detalis follow:"
        $Error[0].CategoryInfo
        $Error[0].InvocationInfo
        $Error[0].ToString()
    }

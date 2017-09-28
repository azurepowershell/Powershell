$aryText = Get-Content -Path ".\stepbystep.txt" 

foreach ($aryElement in $aryText) 
    { 
        $strClass = "organizationalUnit" 
        $strOUName = $aryElement 
        $objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local" 
        $objOU = $objADSI.Create($strCLass, $strOUName) 
        $objOU.SetInfo() 
    }

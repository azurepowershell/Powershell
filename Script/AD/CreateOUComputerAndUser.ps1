Import-Module -Name ActiveDirectory
$name = "ScriptTest"
$domainName = "DC=Montel,DC=local"
$ouPath = "OU={0},{1}" -f $name, $domainName

New-ADOrganizationalUnit -Name $name -Path $domainName -ProtectedFromAccidentalDeletion $false

For($you = 0; $you -le 5; $you++)
    {
        New-ADOrganizationalUnit -Name $name$you -Path  $ouPath -ProtectedFromAccidentalDeletion $false
    }

For($you = 0; $you -le 5; $you++)
    {
        New-ADComputer -Name "TestComputer$you" -path $ouPath
        New-ADUser -name "TestUser$you" -path $ouPath
    }
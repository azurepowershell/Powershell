New-ADOrganizationalUnit -Name TestOU1 -Path "ou=MyTestOU, dc=montel, dc=local"

New-ADGroup -name TestGroup -path "ou=MyTestOU, dc=montel, dc=local" -GroupScope Universal
Add-ADGroupMember -Identity TestGroup -Members TestUser5
remove-ADGroupMember -Identity TestGroup -Members TestUser5

$pwd = ConvertTo-SecureString -String "Password99" -AsPlainText -Force
Set-ADAccountPassword -Identity TestUser5 -NewPassword $pwd -Reset #-Reset må settes for hvis det ikke er passord fra før
Enable-ADAccount -Identity TestUser5



Search-ADAccount -LockedOut
Search-ADAccount -LockedOut | Unlock-ADAccount




get-aduser -filter 'enabled -eq $false' -Server mon-dc11 -Identity
#The -Identity parameter accepts several things: distinguishedName, objectSid (SID), objectGUID (GUID), and sAMAccountName.

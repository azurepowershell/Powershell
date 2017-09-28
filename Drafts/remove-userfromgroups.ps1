$user = 'celin'
$groups = Get-ADPrincipalGroupMembership $user | where {$_.distinguishedName -like "*Distribution Groups*"} | select name

ForEach ($group in $groups) {
    remove-adgroupmember -Identity $group.name -Member $user
}

Write-Host $groups

$groups | clip

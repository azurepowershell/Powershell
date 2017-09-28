$UserCredential = Get-Credential 
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection 
Import-PSSession $Session 

$users = Get-Mailbox -RecipientTypeDetails UserMailbox

foreach($user in $users) {
    $path = $user.Identity + ":\" + (Get-MailboxFolderStatistics $user.Identity | Where-Object { $_.Foldertype -eq "Calendar" } | Select-Object -First 1).Name
    Set-MailboxFolderPermission -Identity $path -User Default -AccessRights LimitedDetails -verbose
    } #end forech



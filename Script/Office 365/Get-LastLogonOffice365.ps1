$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credentials -Authentication Basic -AllowRedirection
Import-PSSession $Session
$a = Get-Mailbox
$a | Foreach {Get-MailboxStatistics $_.Identity | Select DisplayName, LastLogonTime} | sort LastLononTime | ft

Get-MsolUser -UserPrincipalName esra@montel.no | Format-List DisplayName,Licenses


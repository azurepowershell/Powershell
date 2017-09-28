Get-ADUser -Filter * -Properties "LastLogonDate" | 
Sort-Object -Property LastLogonDate -Descending |
Format-Table -Property Name, LastLogonDate -AutoSize
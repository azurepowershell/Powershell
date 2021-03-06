$smtpServer = 'blast.montel.no'
$expireindays = 15
$from = 'Montel AS Administrator <noreply@montel.no>'
$logging = 'Enabled' # Set to Disabled to Disable Logging
$logFile = 'C:\Montel\logs\ad_password_log.csv' # ie. c:\mylog.csv
$testing = 'Enabled' # Set to Disabled to Email Users
$testRecipient = 'stian@montel.no'



# Check Logging Settings
if (($logging) -eq 'Enabled')
{
  # Test Log File Path
  $logfilePath = (Test-Path $logFile)
  if (($logfilePath) -ne 'True')
  {
    # Create CSV File and Headers
    New-Item $logFile -ItemType File
    Add-Content $logFile -Value 'Date,Name,EmailAddress,DaystoExpire,ExpiresOn,Notified'
  }
} # End Logging Check

# System Settings
$textEncoding = [System.Text.Encoding]::UTF8
$date = Get-Date -Format ddMMyyyy
# End System Settings

# Get Users From AD who are Enabled, Passwords Expire and are Not Currently Expired
Import-Module -Name ActiveDirectory
$users = Get-ADUser -filter {
  name -like '*'
} -searchBase 'OU=Users,OU=Montel,DC=montel,DC=local' -properties Name, PasswordNeverExpires, PasswordExpired, PasswordLastSet, EmailAddress |
Where-Object -FilterScript {
  $_.Enabled -eq 'True'
} |
Where-Object -FilterScript {
  $_.PasswordNeverExpires -eq $false 
} |
Where-Object -FilterScript {
  $_.passwordexpired -eq $false 
}
$DefaultmaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge

# Process Each User for Password Expiry
foreach ($user in $users)
{
  $Name = $user.Name
  $emailaddress = $user.emailaddress
  $passwordSetDate = $user.PasswordLastSet
  $PasswordPol = (Get-ADUserResultantPasswordPolicy $user)
  $sent = '' # Reset Sent Flag
  # Check for Fine Grained Password
  if (($PasswordPol) -ne $null)
  {
    $maxPasswordAge = ($PasswordPol).MaxPasswordAge
  }
  else
  {
    # No FGP set to Domain Default
    $maxPasswordAge = $DefaultmaxPasswordAge
  }

  
  $expireson = $passwordSetDate + $maxPasswordAge
  $today = (Get-Date)
  $daystoexpire = (New-TimeSpan -Start $today -End $expireson).Days
        
  # Set Greeting based on Number of Days to Expiry.

  # Check Number of Days to Expiry
  $messageDays = $daystoexpire

  if (($messageDays) -gt '1')
  {
    $messageDays = 'in ' + "$daystoexpire" + ' days.'
  }
  else
  {
    $messageDays = 'today.'
  }

  # Email Subject Set Here
  $subject = "Your password will expire $messageDays"

  # Email Body Set Here, Note You can use HTML, including Images.
  $body = "
    Hi $Name,
    <p style='color:#FF0000'> Your Password will expire </b>$messageDays</b><br></p>
   
    <h3>How to change your password</h3>
    1. Press <b>Ctrl+Alt+Delete</b>, and then click <b>Change a password</b>.<br>
    2. Type your old password followed by a new password as indicated, and then type the new password again to confirm it.<br>
    3. Press <b>Enter</b>.<br>

    VPN connection is required for external users.<br>

    <p>For anyquestions please contact <b>itsupport@montel.no</b><br></p>
  "

   
  # If Testing Is Enabled - Email Administrator
  if (($testing) -eq 'Enabled')
  {
    $emailaddress = $testRecipient
  } # End Testing

  # If a user has no email address listed
  if (($emailaddress) -eq $null)
  {
    $emailaddress = $testRecipient
  }# End No Valid Email

  # Send Email Message
  if (($daystoexpire -ge '0') -and ($daystoexpire -lt $expireindays))
  {
    $sent = 'Yes'
    # If Logging is Enabled Log Details
    if (($logging) -eq 'Enabled')
    {
      Add-Content $logFile -Value "$date,$Name,$emailaddress,$daystoexpire,$expireson,$sent"
    }
    # Send Email Message
    Send-MailMessage -SmtpServer $smtpServer -From $from -To $emailaddress -Subject $subject -Body $body -BodyAsHtml -Priority High -Encoding $textEncoding
  } # End Send Message
  else # Log Non Expiring Password
  {
    $sent = 'No'
    # If Logging is Enabled Log Details
    if (($logging) -eq 'Enabled')
    {
      Add-Content $logFile -Value "$date,$Name,$emailaddress,$daystoexpire,$expireson,$sent"
    }        
  }
} # End User Processing



# End
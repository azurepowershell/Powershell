function New-User
{
  <#
      .SYNOPSIS
      Short Description
      .DESCRIPTION
      Detailed Description
      .EXAMPLE
      New-User
      explains how to use the command
      can be multiple lines
      .EXAMPLE
      New-User
      another example
      can have as many examples as you like
  #>
  param
  (
    [Parameter(Mandatory = $true,HelpMessage = 'Add help message for user', Position = 0)]
    [string]
    $fullName,
    
    [Parameter(Mandatory = $true,HelpMessage = 'Add help message for user', Position = 1)]
    [string]
    $department
  )
  
  #requires -Version 2.0 -Modules ActiveDirectory
  
  if ($department -eq 'Newsdesk')
  {
    $OU = 'OU=News Desk,OU=Users,OU=Montel,DC=montel,DC=local'
  }
  elseif ($department -eq 'Sales' -or $department -eq 'Admin')
  {
    $OU = 'OU=AdminAndSales,OU=Users,OU=Montel,DC=montel,DC=local'
  }
  
  
  
  
  # Split Full name
  $numberOfNames = ($fullName | Measure-Object -Word).Words
  
  if ($numberOfNames -gt 2)
  {
    $firstName, $middleName, $lastName = $fullName.Split(' ',3)
  }
  else 
  {
    $firstName, $lastName = $fullName.Split(' ',2)
  }
  
  
  
  # Create Username
  if ($middleName -ne $null)
  {
    $firstName += ' ' + $middleName
  }
  
  
  try
  {
    $user = Get-ADUser $firstName -Properties samAccountName
  }
  Catch
  {

  }
  
  

  if ($user.samAccountName -ne $firstName) 
  {
    $username = $firstName.ToLower()
    $username = $username.Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a')
  }
  else 
  {
    $username = $firstName + $lastName.Substring(0,1).ToLower()
    $username = $username.Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a')
  }
  

  
  Write-Verbose -Message ("Username will be: $username")
  New-ADUser -SamAccountName $username -Name $fullName -Path $OU -UserPrincipalName ($username + '@montel.no') -GivenName $firstName -Surname $lastName -DisplayName $fullName -ScriptPath 'logonscript.vbs' -EmailAddress ($username + '@montel.no')
  
  Write-Verbose -Message 'Waiting 30 secounds to be sure that the account is ready'
  Start-Sleep -Seconds 30 -Verbose
  
  # Create email addresses
  
  $user = Get-ADUser -Filter {
    samAccountName -eq $username
  } -SearchBase $OU -Properties SamAccountName, EmailAddress, ProxyAddresses, GivenName, Surname




  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.SamAccountName + '@montel.no'
  }
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.GivenName.replace(' ','.').Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '.' +   $user.Surname.Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '@montel.no'
  }
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.SamAccountName + '@montel.de'
  }
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.GivenName.replace(' ','.').Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '.' +   $user.Surname.Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '@montel.de'
  }
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'SMTP:'+ $user.SamAccountName + '@montelnews.com'
  }
  Set-ADUser -Identity $user.SamAccountName -Add @{
    ProxyAddresses = 'smtp:'+ $user.GivenName.replace(' ','.').Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '.' +   $user.Surname.Replace('æ', 'ae').Replace('ø', 'o').Replace('å','a').Replace('ä','a').ToLower() + '@montelnews.com'
  }
}

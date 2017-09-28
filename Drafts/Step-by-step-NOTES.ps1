# Laste ned siste versjon av Powershell
# https://www.microsoft.com/en-us/download/details.aspx?id=50395

# kj�re Powershell kode fra CMD
Powershell (-noexit) -command {& Get-Process}


# kj�re flere eksterne kommandoer i Powershell
ipconfig;route print

# Finne filversjon p� kj�rende programmer
Get-Process -Name explorer -FileVersionInfo
ps explorer -FileVersionInfo

# Finne OS versjon
[System.Environment]::OSVersion.Version

# VERB-NOUN!!

# Popup
$wshSehll = New-Object -ComObject "wscript.shell"
$wshSehll.Popup("Hello World!")

# where-object alias where

# CERT
sl cert:
sl .\\CurrentUser\AuthRoot
(gci).where({$psitem.subject -match 'entrust'})
(gci).where({$psitem.thumbprint -eq 'B31EB1B740E36C8402DADC37D44DF5D4674952F9'})

dir Cert:\CurrentUser -Recurse | ? Subject -Match 'montel'

dir -Recurse | ? NotAfter -LT "1/1/2020"
dir -Recurse | ? NotAfter -LT (get-date)

Get-ChildItem -Recurse | Where-Object { !$_.psiscontainer -and $_.NotAfter -lt '1/1/2020'} | Format-Table Notafter, Thumbprint, subject -AutoSize -Wrap

dir -Recurse | ? {$_.NotAfter -gt (Get-Date) -and $_.NotAfter -le (Get-Date).Add(30)}



# ENV
sl env:
gci


# FILES AND FOLDERS
gci | gm | where {$_.membertype -eq "property"}
gci -file -Force | gm -MemberType Property

New-Item -Path ([io.path]::GetRandomFileName()) -ItemType File
New-Item -Path ([io.path]::GetRandomFileName()) -ItemType Directory

New-TemporaryFile

New-Item -Name mytempfile -ItemType File -Value "My file"
Get-Content .\mytempfile
Add-Content .\mytempfile -Value "NEW INFO"



Get-PSDrive | ? Provider -Match filesystem | ft -AutoSize

# FUNCTIONS

sl function:
gci

gc .\Pause


# REGISTRY

Get-PSDrive  | ? Provider -Match registry

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' 
Get-ChildItem 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
Get-Item 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Dropbox'

New-Item -Path HKCU:\SOFTWARE\temp -Value "temp key"
New-Item -Path HKCU:\SOFTWARE\temp -Force -Verbose
Remove-Item -Path HKCU:\SOFTWARE\temp -Force -Verbose

Set-ItemProperty -Path HKCU:\SOFTWARE\temp -Name newproperty -Value 123 -Type DWord

if ((Get-ItemProperty -Path HKCU:\SOFTWARE\temp -name bogus -ea 0).bogus)
{
  'Property already exists'
}
Else
{
  Set-ItemProperty -Path HKCU:\SOFTWARE\temp -name bogus -Value 'bogus value'
}


Push-Location
Pop-Location


# BOK : Windows Powershell Best Practices



get-help * -Parameter computername | sort name | ft name, synopsis -AutoSize -Wrap

# Record all input and output
Start-Transcript
Stop-Transcript



$testwww11 = New-PSSession -ComputerName test-www11 -Credential montel\sa-stian
Invoke-Command -Session $testwww11 -ScriptBlock {Get-CimInstance win32_bios}
Invoke-Command -ComputerName mon-hv11, mon-hv12, mon-hv13 -ScriptBlock {Get-CimInstance win32_bios} -Credential montel\sa-stian

Invoke-Command -ComputerName test-www11 -ScriptBlock {Get-Process | select -Last 2} -Credential montel\sa-stian


# Do..While kj�rer frem til verdien er oppn�dd
# Do..Until kj�rer til og med n�r verdien er oppn�dd

$i = 0
$caps = 65..91
do
{
    [char]$caps[$i]
    $i++
} while ($i -lt 26)

$i = 0
$ary = 1..5
do
{
    $ary[$i]
    $i++
} Until ($i -eq 5)



# While
# WhileDoesNotRUn.ps1
$i = 1

while ($i -eq 5)
{
    "Inside the while loop"
}


# For
# DemoForLoop.ps1
For($i = 0; $i -le 5; $i++)
{
    '$i equals ' + $i
}
# Eller
$i = 0
For(;$i -le 5; )
{
    "`$i is equal to $i"
    $i++
}

#Endless loop
$i = 0 
for(;;)
{
    $i ; $i++
    Start-Sleep -Seconds 1
}

#ForEach
$ary = 1..5
foreach($i in $ary)
{
    if($i -eq 3) { break }
    $i
}
"Statment following foreach loop"



$ary = 1..5
foreach($i in $ary)
{
    if($i -eq 3) { exit }
    $i
}
"Statment following foreach loop"


# Unng� ELSEIF bruk SWITCH
$a = 2,1,77
Switch ($a)
{
    1 {Write-host "Vi g�r for nummer 1"}
    2 {Write-host "Vi g�r for nummer 2"}
    2 {Write-host "Vi g�r for nummer to"}
    3 {'$a = 3'}
    Default { 'unable to determine value of $a' }
}
"Statement after switch"


# Functions
Function Get-FreeDiskSpace($drive, $computer)
{
  $driveData = Get-WmiObject -Class win32_LogicalDisk -ComputerName $computer -Filter "Name = '$drive'"
  
  "$computer free disk space on drive $drive $("{0:n2}" -f ($driveData.FreeSpace/1MB)) MegaBytes"
}

Get-FreeDiskSpace -drive "c:" -computer localhost


# V2 raskere
Function Get-FreeDiskSpace($drive, $computer)
{
  $driveData = [wmi]"\\$computer\root\cimv2:Win32_logicalDisk.DeviceID='$drive'"
  
   "$computer free disk space on drive $drive $("{0:n2}" -f ($driveData.FreeSpace/1MB)) MegaBytes"
}

Get-FreeDiskSpace -drive "c:" -computer localhost




# DemoTrapSystemException.ps1
Function My-Test([int]$myinput)
{
  "It worked"  
} # End my-test function
# *** Entry Point to Script ***

Trap [system.SystemException] { "error trapped" ; continue}
My-Test -myinput "error"
"After the error"




# I funksjoner er kj�res BEGIN en gang, mens PROCESS kj�re for hvert item i pipeline



# MessureAddOneFilter.ps1

Filter AddOne
{
    "add one filter"
    $_ + 1
}

Measure-Command {1..50000 | AddOne }

# Adv.function
Function my-function
{
    [cmdletbinding()]
    Param()
    Write-Verbose "Verbose stream"
}

my-function -Verbose


# Adv.function med -whatif og -confirm
Function my-function
{
    [cmdletbinding(SupportsShouldProcess=$true)]
    Param($path)
    md $path
}

my-function -path c:\test2 -WhatIf
my-function -path c:\test2 -Confirm


# Adv.function med med alltid confirm
Function my-function
{
    [cmdletbinding(SupportsShouldProcess=$true, ConfirmImpact="high")]
    Param($path)
    md $path
}


# Adv.function sette default parameter
Function my-function
{
    [cmdletbinding(DefaultParameterSetName="path")]
    Param($path)
    md $path
    Write-Host $env:ALLUSERSPROFILE
}


$env:PSModulePath.Split(";") 


#Get-MyModule.ps1
Function Get-MyModule
    {
        Param([string]$name)
        if(-not(Get-Module -name $name))
            {
                if(Get-Module -ListAvailable | 
                    Where-Object {$_.name -eq $name})
                    {
                        Import-Module -Name $name 
                        $true
                    } #End if module available then import
                else {$false} #module not available
            } #End if not module
        else {$true} #module already loaded
    } #end function get-MyModule

If(Get-MyModule -name "ServerManagement") {
        #My fancy code
    }
    else {
        "ServerManager module is not installed on this system." ;exit
    }



    #Benytt dymaiske WMI classes til å hente ut live data
    Get-CimClass *bios* -QualifierName dynamic
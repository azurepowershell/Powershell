﻿Set-Location C:\NanoServerImageGenerator
Import-Module .\NanoServerImageGenerator -Verbose


$pwd = ConvertTo-SecureString -AsPlainText -Force -String 'Password99'

1..3 | % {
    New-NanoServerImage -MediaPath d:\ -TargetPath "c:\VM\nano-hc-0$_\nano-hc-0$_.vhd" -DeploymentType Guest -Edition Datacenter `
1..3 | % {
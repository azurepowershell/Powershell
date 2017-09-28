Clear-Host
 
Write-Host "0 -> Change setting in Windows Update app (default)"
Write-Host "1 -> Never check for updates (not recommended)"
Write-Host "2 -> Notify for download and notify for install"
Write-Host "3 -> Auto download and notify for install"
Write-Host "4 -> Auto download and schedule the install"
 
Write-Host "Enter any character to exit"
Write-Host
switch(Read-Host "Choose Window Update Settings"){
       0 {$UpdateValue = 0}
       1 {$UpdateValue = 1}
       2 {$UpdateValue = 2}
       3 {$UpdateValue = 3}
       4 {$UpdateValue = 4}
       Default{Exit}
}
 
$WindowsUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\"

 
If(Test-Path -Path $WindowsUpdatePath) {
    Remove-Item -Path $WindowsUpdatePath -Recurse
}
 
 
If ($UpdateValue -gt 0) {
    New-Item -Path $WindowsUpdatePath
    New-Item -Path $AutoUpdatePath
}
 
$AutoUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
Set-ItemProperty -Path $AutoUpdatePath -Name NoAutoUpdate -Value 1

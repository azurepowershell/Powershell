$Shell = New-Object -ComObject Shell.Application
$Folder = $Shell.Namespace(0x14)
$FontPath = Get-ChildItem .\files\fonts
foreach($File in $FontPath) {
    if (!(Test-Path ($env:windir + "\Fonts\$File"))) {
        $Folder.CopyHere($File.fullname,0x14)
    }
}

exit
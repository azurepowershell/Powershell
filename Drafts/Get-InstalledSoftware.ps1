$dteStart = Get-date

$query = "Select * from Win32_product"
Write-Host "Counting Installed Products. This may take a little while. " -ForegroundColor Green `n

Get-CimInstance -Query $query | Format-Table Name, Caption, Vendor, Version -Wrap -AutoSize

$dteEnd = Get-Date
$dteDiff = New-TimeSpan $dteStart $dteEnd

"`n"
Write-Host "It took " $dteDiff.TotalSeconds " Secounds for this script to complete." -ForegroundColor Green



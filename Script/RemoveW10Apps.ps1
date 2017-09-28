$Applist = Get-AppXProvisionedPackage -online

$Applist | WHere-Object {$_.packagename -like '*3DBuilder*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*Appconnector*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*BingFinance*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*BingNews*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*BingSports*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*BingWeather*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*CommsPhone*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*ConnectivityStore*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*Getstarted*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*Messaging*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*MicrosoftOfficeHub*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*MicrosoftSolitaireCollection*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*OneNote*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*Sway*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*People*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*SkypeApp*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*WindowsAlarms*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*WindowsCamera*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*windowscommunicationsapps*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*WindowsMaps*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*WindowsPhone*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*WindowsSoundRecorder*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*ZuneMusic*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*ZuneVideo*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*xbox*'} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like '*contact support*'} | Remove-AppxProvisionedPackage -online
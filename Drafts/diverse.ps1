[math]::PI

(dir -Directory).CreateSubdirectory('test')

$today = get-date
$today.DayOfWeek
$today.DayOfYear
$today.AddMonths(9)

#get-service -> gsv

Get-Service | Where-Object {$_.Status -eq 'Running'}

Get-Service | Select-Object Name, Status

Get-ChildItem 'C:\users\stians\Downloads' | Select-Object Name, Length, @{Name='MBs';Expression={$_.length / 1Mb}}

#ForEach-Object -> %

dir C:\Montel -Recurse | Where-Object {$_.CreationTime.Year -eq (Get-Date).Year} |
    ForEach-Object -Begin {get-date} -Process {Out-File filelog.txt -Append -InputObject $_.FullName} -End {get-date}

#Passthru gir deg outpu i pipen


#Select object
$os = Get-WmiObject Win32_operatingsystem -ComputerName it-w-07, it-w-08
$os | select PScomputername, caption, @{Name='IPv4';Expression={(Get-NetIPAddress -AddressFamily IPv4)}}
#add member
$os | Add-Member -MemberType ScriptProperty -Name IPv4 -Value {(Get-NetIPAddress -AddressFamily IPv4)}
$os | select PSComputerName, Caption, IPv4
$os | Add-Member -MemberType AliasProperty -Name OperatingSystem -Value Caption
$os | Add-Member -MemberType AliasProperty -Name ServicePack -Value ServicePackMajorVersion
$os | Add-Member -MemberType NoteProperty -Name Department -Value 'PSOps'
$os | select PSComputerName, OperatingSystem, ServicePack, Department

$os | Add-Member -MemberType ScriptMethod -Name Ping -Value {Test-Connection -ComputerName $this.PSComputerName} -Force
$os.Ping()


#new-object
$PC = New-Object psobject -Property @{
    User = $env:USERNAME.ToLower()
    Machine = $env:COMPUTERNAME.ToUpper()
    IPv4 = (Get-NetIPAddress -AddressFamily IPv4)
    OS = (Get-CimInstance Win32_OperatingSystem).Caption
    SP = (Get-CimInstance Win32_OperatingSystem).ServicePackMajorVersion
}

#object er i minne


#Extending Types :: Session based
Update-TypeData -TypeName System.DateTime `                -MemberType ScriptProperty `                -MemberName Quarter `                -Value {if ($this.Month -in @(1,2,3)) {"Q1"} `                        elseif ($this.Month -in @(4,5,6)) {"Q2"} `                        elseif ($this.Month -in @(7,8,9)) {"Q3"} `                        else {"Q4"}}(Get-Date).Quarter#WMI Explorer 2.0#Bruk get-ciminstance og ikke get wmiobject!!!#-filter server side# | where client side# import ps modules$session = New-PSSession test-www11 -Credential montel\sa-stianImport-Module WebAdministration -PSSession $session
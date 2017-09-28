#requires -Version 2
function Get-Uptime
{
    <#
            .SYNOPSIS
            Get the latest boot time and calculate the uptime
            .DESCRIPTION
            Get the latest boot time and calculate the uptime
            .EXAMPLE
            Get-Uptime -ComputerName server1-cred domain\user
    #>
    [CmdletBinding()]
    param
    (
        
        [Parameter(Mandatory = $true, Position = 0)]
        [Object]
        $ComputerName
    )
    
    $os = Get-WmiObject -Class win32_operatingsystem -ComputerName $ComputerName -ErrorAction SilentlyContinue
    if ($os.LastBootUpTime) 
    {
        $uptime = (Get-Date) - $os.ConvertToDateTime($os.LastBootUpTime)
        Write-Output -InputObject ('Last boot: ' + $os.ConvertToDateTime($os.LastBootUpTime) )
        Write-Output -InputObject ('Uptime   : ' + $uptime.Days + ' Days ' + $uptime.Hours + ' Hours ' + $uptime.Minutes + ' Minutes' )
    }
    else 
    {
        Write-Warning -Message "Unable to connect to $ComputerName"
    }
}

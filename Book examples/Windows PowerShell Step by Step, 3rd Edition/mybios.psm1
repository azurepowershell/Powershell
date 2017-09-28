<#
.Synopsis
   Gets BIOS information from local or remote computer
.DESCRIPTION
   This function gets BIOS information from local or remote computer
.PARAMETER COMPUTERNAME
   The name of the remote computer
.EXAMPLE
   Get-MyBIOS
   Gets BIOS information from local computer
.EXAMPLE
   Get-MyBIOS -cn remoteComputer
   Gets BIOS information from remote computer named remotecomputer
#>
function Get-MyBIOS
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        
        [Alias("cn")]
        [Parameter(ValueFromPipeline=$true,
                   Position=0,
                   ParametersetName="remote")]
        [string]$ComputerName
    )

    
    Process
    {
        switch ($PSCmdlet.ParameterSetName)
        {
            "remote" {Get-CimInstance -ClassName Win32_BIOS -cn $ComputerName}
            Default {Get-CimInstance -ClassName Win32_BIOS}
        }
    }

}


New-Alias -Name gmb -Value Get-MyBIOStest
Export-ModuleMember -Function * -Alias *
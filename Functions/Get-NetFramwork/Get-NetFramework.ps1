#requires -Version 2
function Get-NetFramework
{
    <#
            .SYNOPSIS
            Get the .NET Framework version
            .DESCRIPTION
            Get the .NET Framework version
            .EXAMPLE
            Get-NetFramework -ComputerName Server1, Server2
    #>
    param
    (
        [Parameter(Mandatory = $true, 
                   Position = 0, 
                   HelpMessage = 'Please add a help message here')]
        [Object]$ComputerName
    )
    
    Invoke-Command -ScriptBlock {
        (Get-ChildItem -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse |
            Get-ItemProperty -Name Version, Release -ErrorAction SilentlyContinue |
            Where-Object -FilterScript {
                $_.PSChildName -match '^(?!S)\p{L}'
            } |
            Select-Object -Property @{
                Expression = {
                    $_.PSChildName
                }
                Label      = '.NET Name'
            }, Version, Release, @{
                name       = 'Product'
                expression = {
                    switch($_.Release) {
                    378389 { [Version]'4.5' }
                    378675 { [Version]'4.5.1' }
                    378758 { [Version]'4.5.1' }
                    379893 { [Version]'4.5.2' }
                    393295 { [Version]'4.6' }
                    393297 { [Version]'4.6' }
                    394254 { [Version]'4.6.1' }
                    394271 { [Version]'4.6.1' }
                    }
                }
            }
        )
    } -ComputerName $ComputerName
}


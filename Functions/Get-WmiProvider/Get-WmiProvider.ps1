function Get-WmiProvider {
    Param(
        [string]$nameSpace,
        [string]$computer)
        Get-CimInstance -ClassName __Provider -Namespace $nameSpace |
        Sort-Object -Property Name |
        Select-Object name
}#end function Get-WmiProvider
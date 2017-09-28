function Get-WmiNameSpace{
    Param(
        $namespace = "root",
        $computer = "localhost"
    )
    Get-WmiObject -Class __NAMESPACE -ComputerName $computer -Namespace $namespace -ErrorAction "SilentlyContinue" | 
    ForEach-Object -Process {
        $subns = Join-Path -Path $_.__NAMESPACE -ChildPath $_.name 
        if($subns -notmatch 'directory') {$subns}
        $namespaces += $subns + "'r'n"
        Get-WmiNameSpace -namespace $subns -computer $computer
    }
}#end Get-WmiNameSpace
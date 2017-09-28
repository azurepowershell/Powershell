function Remove-AzureDNS
{
    <#
            .SYNOPSIS
            Create record in Azure
            .DESCRIPTION
            Create A record or CNAME record in Azure DNS
            .EXAMPLE
            Remove-AzureDNS -RecordType a -name www -ZoneName domain.com -ResouceGroupName MyRG
            .EXAMPLE
            Remove-AzureDNS -RecordType cname -name sub -ZoneName domain.com -ResouceGroupName MyRG
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = 'A or CNAME')]
        [ValidateSet('A', 'CNAME')]
        [System.String]
        $RecordType,
        
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = 'Name for A records')]
        [System.String]
        $name,
        
        [Parameter(Mandatory = $true, Position = 3)]
        [System.String]
        $ZoneName,
        
        [Parameter(Mandatory = $true, Position = 4)]
        [System.String]
        $ResouceGroupName
    )
    
    

        
    
    Remove-AzureRmDnsRecordSet -Name $name -RecordType $RecordType.ToUpper() -ZoneName $ZoneName -ResourceGroupName $ResouceGroupName  
    
}
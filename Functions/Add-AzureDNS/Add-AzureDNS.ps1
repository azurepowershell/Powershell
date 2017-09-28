function Add-AzureDNS
{
    <#
            .SYNOPSIS
            Create record in Azure
            .DESCRIPTION
            Create A record or CNAME record in Azure DNS
            .EXAMPLE
            Add-AzureDNS -RecordType a -name www -Value 1.2.3.4 -ZoneName domain.com -ResouceGroupName MyRG -Verbose
            .EXAMPLE
            Add-AzureDNS -RecordType cname -name sub -Value www.domain.com -ZoneName domain.com -ResouceGroupName MyRG
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
        
        [Parameter(Mandatory = $true, Position = 2, HelpMessage = 'IP or Alias')]
        [Object]
        $Value,
        
        [Parameter(Mandatory = $true, Position = 3)]
        [System.String]
        $ZoneName,
        
        [Parameter(Mandatory = $true, Position = 4)]
        [System.String]
        $ResouceGroupName
    )
    
    

    
    
    
    $rs = New-AzureRmDnsRecordSet -Name $name -RecordType $RecordType.ToUpper() -Ttl 3600 -ZoneName $ZoneName -ResourceGroupName $ResouceGroupName 
    
    
    
    if ($RecordType -eq 'A')
    {
        Add-AzureRmDnsRecordConfig -RecordSet $rs -Ipv4Address $Value
    }
    
    elseif ($RecordType -eq 'CNAME')
    {
        Add-AzureRmDnsRecordConfig -RecordSet $rs -Cname $Value
    }
    
    
    
    
    Set-AzureRmDnsRecordSet -RecordSet $rs
}
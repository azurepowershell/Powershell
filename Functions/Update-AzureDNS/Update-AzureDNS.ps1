#requires -Version 2 -Modules AzureRM.Dns
function Update-AzureDNS
{
    <#
            .SYNOPSIS
            Update record in Azure
            .DESCRIPTION
            Update A record or CNAME record in Azure DNS
            .EXAMPLE
            Update-AzureDNS -RecordType a -name www -NewValue 1.2.3.4 -ZoneName domain.com -ResouceGroupName MyRG
            .EXAMPLE
            Update-AzureDNS -RecordType cname -name sub -NewValue www.domain.com -ZoneName domain.com -ResouceGroupName MyRG
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
        $NewValue,
        
        [Parameter(Mandatory = $true, Position = 3)]
        [System.String]
        $ZoneName,
        
        [Parameter(Mandatory = $true, Position = 4)]
        [System.String]
        $ResouceGroupName
    )
    
    

    
    
    
    $rs = Get-AzureRmDnsRecordSet -Name $name -RecordType $RecordType.ToUpper() -ZoneName $ZoneName -ResourceGroupName $ResouceGroupName 
    
    
    
    if ($RecordType -eq 'A')
    {
        $rs.Records[0].Ipv4Address = $NewValue
    }
    
    elseif ($RecordType -eq 'CNAME')
    {
        $rs.Records[0].CNAME = $NewValue
    }
    
    
    
    
    Set-AzureRmDnsRecordSet -RecordSet $rs
}


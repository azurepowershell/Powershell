function Connect-Azure
{
    <#
            .SYNOPSIS
            Connects to AzureRM
            .DESCRIPTION
            .SYNOPSIS
            Connects to AzureRM
            .EXAMPLE
            Connect-Azure -AzureRmSubscription 'Pay-As-you-Go'
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [Object]
        $AzureRmSubscription
    )
    
    Add-AzureRmAccount | Out-Null
    
    
    Set-AzureRmContext -SubscriptionName $AzureRmSubscription | Out-Null
    
    $connectedTo = (Get-AzureRmContext).Subscription | Format-List SubscriptionName | Out-String
    Write-Host "You are now connected to: $connectedTo" -ForegroundColor Green
}
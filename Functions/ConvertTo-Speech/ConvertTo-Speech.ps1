function ConvertTo-Speech
{
    <#
        .SYNOPSIS
        Convert text to speech
        .DESCRIPTION
        Convert text to speech
        .EXAMPLE
        ConvertTo-Speech -Text 'This function rules'
        The computer will the say 'This function rules'
        .EXAMPLE
        ConvertTo-Speech -Text 'This function rules' -Rate -3
        The computer will the say 'This function rules' slower than normal
        Use -Rate to set speed. Valid range: -10 - 10
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [System.String]
        $Text,
        
        [Parameter(Mandatory=$false, Position=1)]
        [System.Int32]
        [ValidateRange(-10,10)]
        $Rate = 1
    )
    
    $sapi = New-Object -ComObject Sapi.SPVoice
    $sapi.Rate = $Rate
    $null = $sapi.Speak($Text)
}
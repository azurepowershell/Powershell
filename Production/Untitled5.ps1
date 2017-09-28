function Remove-GibraltarLogs
{
  [CmdletBinding]
  <#
      .Synopsis
      Script for å slette Gibraltar logs
      .DESCRIPTION
      Rapid Recovery fyller opp c:\ med log filer. 
      Dette scriptet kjører som en Scheduled Task for å slette disse filene
      slik at de ikke fyller opp c:\
      .EXAMPLE
      removeGibraltarLogs.ps1
      Bare kjør filen slik den er. Det er ingen mulige parametere
  #>
  
  
  Write-Verbose -Message "Removing Gibraltar Logfiles"
  
  #Finner filer som skal slettes
  $path = 'C:\ProgramData\gibraltar'
  $files = Get-ChildItem -Path $path -Recurse -Include *.glf, *.lock, *.gak  
  $files | Remove-Item -ErrorAction SilentlyContinue
  $files = Get-ChildItem -Path $path -Recurse -Include *.glf, *.lock, *.gak
  
  
}

Remove-GibraltarLogs
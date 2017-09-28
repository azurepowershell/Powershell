function Remove-GibraltarLogs
{
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

  
  #Finner filer som skal slettes
  $path = "C:\ProgramData\AppRecovery\Gibraltar\Local Logs"
  $files = Get-ChildItem -Path $path -Recurse -Include *.glf, *.lock, *.gak 
  $files | Remove-Item -ErrorAction SilentlyContinue
  
  
  
}

Remove-GibraltarLogs
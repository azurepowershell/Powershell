Add-PSSnapin -Name VeeamPSSnapin


$jobs = 'Daily', 'Weekend'

foreach ($job in $jobs)
{
Write-Host "$job" -ForegroundColor Red
    (Get-VBRBackup -Name $job).GetallStorages() |
        Select-Object -Property @{
          Name = 'Name'
          Expression = {
            $_.FileName
          }
        }, @{
          Name = 'Date'
          Expression = {
            $_.CreationTime
          }
        }, @{
          Name = 'Data Size (GB)'
          Expression = {
            [Math]::round($_.Stats.DataSize/1gb, 2)
          }
        }, @{
          Name = 'Backup Size (GB)'
          Expression = {
            [Math]::round($_.Stats.BackupSize/1gb, 2)
          }
        }, @{
          Name = 'De-dupe Ratio (%)'
          Expression = {
            $_.Stats.DedupRatio
          }
        }, @{
          Name = 'Compress Ratio (%)'
          Expression = {
            $_.Stats.CompressRatio
          }
        } |
    Sort-Object -Property Date -Descending|
    Format-Table
}


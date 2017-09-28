$ip = Invoke-RestMethod -uri http://checkip.amazonaws.com
Invoke-RestMethod -uri "http://geoip.nekudo.com/api/$ip" | Select-Object -ExcludeProperty Country
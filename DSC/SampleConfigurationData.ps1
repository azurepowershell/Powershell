$ConfigurationData = @{
    AllNodes = @(
        @{NodeName = "SRV1" ; Role      = "FilePrint"},
        @{NodeName = "SRV2" ; Role      = "WebServer"},
        @{NodeName = "*"    ; Features  = "Windows-Server-Backup","Powershell-V2"}
    );
    NonNodeData = @{
        MyData = Import-Csv c:\csv\ConfigData.csv
    } 
} #ConfigurationData
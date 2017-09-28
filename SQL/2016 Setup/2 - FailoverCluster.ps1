#Installere Failover Clustering


Install-WindowsFeature -Name Failover-Clustering -IncludeManagementTools -ComputerName MON-DB15, MON-DB16
Test-Cluster –Node MON-DB15, MON-DB16
New-Cluster –Name SQLAlwaysOn –Node MON-DB15, MON-DB16 –StaticAddress 10.10.110.30 -NoStorage


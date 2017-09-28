
Enter-PSSession mon-mgmt11 -Credential (Get-Credential)


import-module virtualmachinemanager
$VM = "MON-LB-L"
Stop-SCVirtualMachine -VM $VM
Set-SCVirtualMachine -VM $VM -CPUCount 2 -MemoryMB 2048 -DynamicMemoryEnabled $false
start-SCVirtualMachine -VM $VM



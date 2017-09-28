Enter-PSSession -vmname nano-hc-01
djoin /requestodj /loadfile \\10.0.10.10\share\nano1.djoin /windowspath c:\windows /localos
shutdown -r -t 0
exit

Enter-PSSession -vmname nano-hc-02
djoin /requestodj /loadfile \\10.0.10.10\share\nano2.djoin /windowspath c:\windows /localos
shutdown -r -t 0
exit

Enter-PSSession -vmname nano-hc-03
djoin /requestodj /loadfile \\10.0.10.10\share\nano3.djoin /windowspath c:\windows /localos
shutdown -r -t 0
exit


Enter-PSSession -vmname nano-hc-06
djoin /requestodj /loadfile \\10.0.10.10\share\nano6.djoin /windowspath c:\windows /localos
shutdown -r -t 0
exit




$cred


Enter-PSSession -vmname nano1
djoin /requestodj /loadfile \\10.0.10.10\share\nano1.djoin /windowspath c:\windows /localos
shutdown -r -t 0


















# LeerLogsSistema.ps1
Get-EventLog -LogName System -Newest 20 | Format-Table -AutoSize
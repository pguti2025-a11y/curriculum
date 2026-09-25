copiaSeguridad.ps1
$origen = "C:\Datos"
$destino = "D:\Backups\$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')"

New-Item -ItemType Directory -Path $destino -Force | Out-Null
Copy-Item -Path "$origen\*" -Destination $destino -Recurse -Force

Write-Host "Backup completado en $destino"
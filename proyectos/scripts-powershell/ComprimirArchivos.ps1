# ComprimirArchivos.ps1
$carpeta = "C:\Datos"
$zip     = "C:\Backup\datos.zip"

New-Item -ItemType Directory -Path (Split-Path $zip) -Force | Out-Null
Compress-Archive -Path $carpeta -DestinationPath $zip -Force

Write-Host "Carpeta comprimida en $zip"
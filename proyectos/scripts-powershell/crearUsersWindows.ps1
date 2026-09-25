crearUsersWindows.ps1
$usuario = "usuarioDemo"
$clave = "P@ssword!" | ConvertTo-SecureString -AsPlainText -Force

New-LocalUser -Name $usuario -Password $clave -FullName "Usuario Demo" -Description "Creado por PowerShell"
Add-LocalGroupMember -Group "Administrators" -Member $usuario

Write-Host "Usuario $usuario creado y agregado a Administradores."
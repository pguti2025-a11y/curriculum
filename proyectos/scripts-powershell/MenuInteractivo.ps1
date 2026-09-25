# MenuInteractivo.ps1
do {
    Clear-Host
    Write-Host "===== MENÚ ====="
    Write-Host "1. Ver fecha"
    Write-Host "2. Listar archivos"
    Write-Host "3. Salir"
    $op = Read-Host "Elige una opción"

    switch ($op) {
        "1" { Write-Host "Fecha actual: $(Get-Date)" }
        "2" { Get-ChildItem }
        "3" { Write-Host "Saliendo..." }
        default { Write-Host "Opción inválida." }
    }

    Pause
} until ($op -eq "3")
# monitorearServicio.ps1
$servicio = "Spooler" # Cola de impresión

$info = Get-Service -Name $servicio
if ($info.Status -eq "Running") {
    Write-Host "El servicio $servicio está en ejecución."
} else {
    Write-Host "El servicio $servicio está detenido. Iniciando..."
    Start-Service -Name $servicio
    Write-Host "Servicio $servicio iniciado."
}
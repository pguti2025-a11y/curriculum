# instalarAppsWinget.ps1
$apps = @(
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "7zip.7zip"
)

foreach ($app in $apps) {
    Write-Host "Instalando $app ..."
    winget install --id $app --silent --accept-source-agreements --accept-package-agreements
}

Write-Host "Instalación completada."
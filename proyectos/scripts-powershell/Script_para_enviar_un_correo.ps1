# Script para enviar un correo (SMTP)
$smtp = "smtp.servidor.com"
$de = "tu_correo@dominio.com"
$para = "destino@dominio.com"
$asunto = "Prueba PowerShell"
$cuerpo = "Este es un correo enviado desde PowerShell."

Send-MailMessage -SmtpServer $smtp -To $para -From $de -Subject $asunto -Body $cuerpo
# (Puede ajustarlo a Gmail, Outlook, Office 365, etc.)
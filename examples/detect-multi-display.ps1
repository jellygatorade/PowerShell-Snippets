$totalDisplays = @(Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams).Length
Write-Host "Displays connected: $totalDisplays"

while ($totalDisplays -lt 2) {
    $totalDisplays = @(Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams).Length
    Write-Host "Displays connected: $totalDisplays"
    Start-Sleep -seconds 5
}

cd "C:\Users\Username\Desktop\whereever"
Start-Process -FilePath ".\Dutch Art in a Global Age.exe"
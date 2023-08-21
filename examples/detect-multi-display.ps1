$totalDisplays = @(Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams).Length
Write-Host "Displays connected: $totalDisplays"

while ($totalDisplays -lt 2) {
    $totalDisplays = @(Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams).Length
    Write-Host "Displays connected: $totalDisplays"
    Start-Sleep -seconds 5
}

cd "C:\Users\kkane.MOA\Non-OneDrive Docs\Unity Projects\Dutch Art in a Global Age\Builds"
Start-Process -FilePath ".\Dutch Art in a Global Age.exe"

# for writing the output to a log file
# try powershell -windowstyle minimized .\myscript.ps1 -verbose >> \desktop\ps.log
# https://stackoverflow.com/questions/13784382/how-can-i-redirect-powershell-output-when-run-from-task-scheduler
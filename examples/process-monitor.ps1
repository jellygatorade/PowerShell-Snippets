# Something like ps/top in Linux

# Original code
# while (1) { ps | sort -desc cpu | select -first 30; sleep -seconds 2; cls }

# Reformatted in PowerShell language conventions
while ($true) { 
    Get-Process | Sort-Object -desc cpu | Select-Object -first 30
    Start-Sleep -seconds 2
    Clear-Host
}
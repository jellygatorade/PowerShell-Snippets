$object = New-Object System.Object
$object | Add-Member -type NoteProperty -name Hostname -Value "Hello World!"
$object | Add-Member -type NoteProperty -name IP -Value "192.168.1.10"

Write-Host $object.GetType() # System.Object

Write-Host ($object | Format-Table | Out-String)

Write-Host ($object | Format-List | Out-String)

Write-Host $object.Hostname

Write-Host $object.IP

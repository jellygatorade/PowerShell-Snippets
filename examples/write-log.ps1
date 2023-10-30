$humanTime = "T"
$sortableDateTime = "yyyy-MM-dd HH:mm:ss"

function Write-Log($String) {
    Write-Output "[$(Get-Date -Format $sortableDateTime)] $String"
}

Write-Log -String "Testing..."
# show PowerShell version

$PSVersionTable

Write-Host "`n" # blank line

# Comparison operators examples
#
# See
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-5.1

# equality

Write-Host $(0 -eq 1) # equals
Write-Host $(0 -ne 1) # not equals
Write-Host $(0 -gt 1) # greater than
Write-Host $(0 -ge 1) # greater than or equal
Write-Host $(0 -lt 1) # less than
Write-Host $(0 -le 1) # less than or equal

# Todo
#
# Matching
# Replacement
# Containment
# Type
#
# See
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-5.1


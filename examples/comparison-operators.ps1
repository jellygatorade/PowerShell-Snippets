# show PowerShell version

$PSVersionTable

Write-Host "`n" # blank line


# Comparison operators examples
#
# See
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-5.1

# Todo
#
# Matching - Regex $Matches hashtable - Write-Host $Matches[0]
# Containment - in and notin
# Type comparison

# equality

Write-Host $(0 -eq 1) # equals
Write-Host $(0 -ne 1) # not equals
Write-Host $(0 -gt 1) # greater than
Write-Host $(0 -ge 1) # greater than or equal
Write-Host $(0 -lt 1) # less than
Write-Host $(0 -le 1) # less than or equal

Write-Host "`n" # blank line


# type

$a = 1
$b = "1"

Write-Host '$a is ' + $a.GetType()
Write-Host '$b is ' + $b.GetType()

Write-Host $($a -is [int])
Write-Host $($a -is [System.Int32])
Write-Host $($b -is [string])
Write-Host $($b -is [System.String])

# type comparison is not meant to be used as below

try { Write-Host $($a -is $b) }
catch [System.Management.Automation.RuntimeException] { 'Error: {0}' -f $_.Exception.Message }

try { Write-Host $($a -isnot $b) }
catch [System.Management.Automation.RuntimeException] { 'Error: {0}' -f $_.Exception.Message }

# instead use

Write-Host $($a.GetType() -is $b.GetType())
Write-Host $($a.GetType() -isnot $b.GetType())

Write-Host "`n" # blank line


# matching - wildcard strings

"PowerShell" -like    "*shell"           # Output: True
"PowerShell" -notlike "*shell"           # Output: False
"PowerShell" -like    "Power?hell"       # Output: True
"PowerShell" -notlike "Power?hell"       # Output: False
"PowerShell" -like    "Power[p-w]hell"   # Output: True
"PowerShell" -notlike "Power[p-w]hell"   # Output: False

"PowerShell", "Server" -like "*shell"    # Output: PowerShell
"PowerShell", "Server" -notlike "*shell" # Output: Server

Write-Host "`n" # blank line


# matching - Regex
"PowerShell" -match    '^Power\w+' # Output: True
'bag'        -notmatch 'b[iou]g'   # Output: True

"PowerShell", "Super PowerShell", "Power's hell" -match '^Power\w+'  # Output: PowerShell
"Bag", "Beg", "Big", "Bog", "Bug"  -match 'b[iou]g'                  # Output: Big, Bog, Bug


# Replacement

"book" -replace "B", "C"  # By default, the -replace operator is case-insensitive
"book" -ireplace "B", "C" # Case insensitive
"book" -creplace "B", "C" # Case-sensitive; hence, nothing to replace

Write-Host "`n" # blank line


# Containment

"abc", "def" -contains "def"                  # Output: True
"abc", "def" -notcontains "def"               # Output: False
"Windows", "PowerShell" -contains "Shell"     # Output: False
"Windows", "PowerShell" -notcontains "Shell"  # Output: True
"abc", "def", "ghi" -contains "abc", "def"    # Output: False
"abc", "def", "ghi" -notcontains "abc", "def" # Output: True

$DomainServers = "ContosoDC1","ContosoDC2","ContosoFileServer","ContosoDNS",
                 "ContosoDHCP","ContosoWSUS"
$thisComputer  = "ContosoDC2"

$DomainServers -contains $thisComputer        # Output: True

# When the right-hand side operand is a collection, 
# these operators convert the value to its string representation 
# before comparing it to the left-hand side collection.

$a = "abc", "def"
"abc", "def", "ghi" -contains $a # Output: False

# The following statements are equivalent
$a, "ghi" -contains $a           # Output: True
"$a", "ghi" -contains $a         # Output: True
"abc def", "ghi" -contains $a    # Output: True


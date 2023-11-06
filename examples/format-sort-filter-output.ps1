# See
#
# Sort-Object
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/sort-object?view=powershell-5.1 
#
# Select-Object
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-5.1
#
# Where-Object
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-5.1
#
# Using Format commands to change output view
# https://learn.microsoft.com/en-us/powershell/scripting/samples/using-format-commands-to-change-output-view?view=powershell-5.1

#Get-Command -Verb Format -Module Microsoft.PowerShell.Utility | Format-List
#Get-Command -Verb Format -Module Microsoft.PowerShell.Utility | Format-Table

# Get PowerShell Utilities whose property CommandType is "Function" and write the output in table form
Get-Command -Verb Format -Module Microsoft.PowerShell.Utility | Where-Object { $_.CommandType -eq "Function" } | Format-Table
 
# Get the five processes that are using the most memory
# - Get-Process cmdlet gets the processes on the computer
# - Sort-Object cmdlet sorts the processes according to memory (working set) usage
# - Select-Object cmdlet selects only the last five members of the resulting array of objects
Get-Process | Sort-Object -Property WS | Select-Object -Last 5 | Format-Table

# Select unique characters from an array
# - Select only first 3 in this list, and print only unique entries
"a","a","b","c","a","a" | Select-Object -First 3 -Unique
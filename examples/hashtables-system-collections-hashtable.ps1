# Hashtables, as preferred by PowerShell
#
# See
# PowerShell Types - 4.3.3 Hashtables
# https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-04?view=powershell-5.1
#
# See also
# Everything you wanted to know about hashtables
# https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-hashtable?view=powershell-5.1

$environments = @{
    Prod = 'SrvProd05'
    QA   = 'SrvQA02'
    Dev  = 'SrvDev12'
}

Write-Host $environments.GetType() # System.Collections.Hashtable

Write-Host ($environments | Format-Table | Out-String)

Write-Host ($environments | Format-List | Out-String)

Write-Host $environments['Prod'] # Use bracket notation for key access
Write-Host $environments.Prod    # Or use dot notation for key access

Write-Host $environments["QA"]
Write-Host $environments.QA

Write-Host $environments["Prod", "QA"].GetType() # Mutliselection, provide an array of keys to get multiple values, returns type System.Object[]

# Loop over hashtable keys
foreach($key in $environments.keys)
{
    $message = '{0} env requires server hostname {1}' -f $key, $environments[$key]
    Write-Output $message
}
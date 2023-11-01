# Try, Catch, Finally
#
# See
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_try_catch_finally?view=powershell-5.1
# https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-exceptions?view=powershell-5.1

#
# Example 1 ##############################
#

try 
{
    throw "Bad thing happened"
}
catch
{ 
    'Error: {0}' -f $_.Exception.Message 

    # Print all properties of Exception
    #$_.Exception.PSObject.Properties
    #$_.Exception.PSObject.Properties | Select-Object -Expand Name
} 
finally 
{ 
    "first complete" 
}

Write-Host "`n" # blank line

#
# Example 2 ##############################
#

# Catching typed exceptions
#
# See
# The big list of .NET exceptions
# https://powershellexplained.com/2017-04-07-all-dotnet-exception-list/

try 
{
    $a = 1
    $b = "1"
    Write-Host $($a -is $b) # throws exception
}
catch [System.Management.Automation.RuntimeException] # exception type
{ 
    'Error: {0}' -f $_.Exception.Message 
    'Error source: {0}' -f $_.Exception.Source 
} 
finally 
{ 
    "Second complete" 
}



# About special escape characters in PowerShell
#
# See
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_special_characters?view=powershell-5.1

function Blank-Line {
    Write-Host "`n"
}

function Carriage-Return {
    Write-Host "`r"
}

function Horizontal-Tab {
    return "`t"
}


$something = "something"
$somethingElse = "something else"
$somethingMore = "something more"

Write-Host $something
Blank-Line
Write-Host $somethingElse
Carriage-Return
Write-Host "$something and $somethingElse"
Write-Host (Horizontal-Tab) "and $somethingMore and $somethingElse" # parens allows Horizontal-Tab func to execute first, and then concatenate returned string
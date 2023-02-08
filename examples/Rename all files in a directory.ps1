# from 
# StackOverflow - How to add a suffix to all the files
# https://stackoverflow.com/questions/57041671/how-to-add-a-suffix-to-all-the-files
#
# -whatif flag shows output with actually running the command

$location = "C:\Users\path\to\whatever"

# Select all files in $location that are not directories
$files = Get-ChildItem $location -Attributes !Directory

# Write-Host $files

$files | Rename-Item -NewName {$_.Basename + '-append-this-string' + $_.Extension} -whatif
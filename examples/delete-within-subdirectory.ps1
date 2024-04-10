$parentDirPath    = "C:\Users\kkane.MOA\Non-OneDrive\PowerShell\Test Directory\*\Trash"
$filters1         = '.txt'
$filters2         = '.jpg' , '.png', '.tif'
$filtersWildcard  = '*.jpg' , '*.png', '*.tif'

# Where is alias for Where-Object
# % is alias for ForEach-Object

# Find all paths to delete
# Get-ChildItem Method

#Get-ChildItem $parentDirPath -Recurse | Where {$filters1 -contains $_.extension} | % { Write-Host $_.FullName }

# Find all paths to delete
# Resolve-Path Method
# Faster than Get-ChildItem because doesn't read all the extra data that Get-ChildItem does

$filtersWildcard | % { Join-Path $parentDirPath $_ } | Resolve-Path | % { Write-Host $_ }

# # Leaves the trash folder
# Remove-Item -Path ".\Test Directory\*\Trash\*.*" -Force

# # Deletes the trash folder
# Remove-Item -Path ".\Test Directory\*\Trash\" -Recurse -Force


$userResponse = Read-Host "Proceed? Type 'yes' to continue"

switch ($userResponse)
{
    "yes" { Write-Host "Continuing" }
    default { Write-Host "Exiting" } 
}
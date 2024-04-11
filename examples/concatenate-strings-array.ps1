## Create a new array with * prepended to each string in the original array

$extFilters         = '.jpg' , '.png', '.tif'
$extFiltersWildcard = @()

$extFilters | % { 
    $item = -join("*", $_)
    $extFiltersWildcard += $item
}

Write-Host $extFilters
Write-Host $extFiltersWildcard
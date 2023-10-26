# Testing for CCiccone 10/26/2023
# 
# Requires ImportExcel module ->
# https://www.powershellgallery.com/packages/ImportExcel/7.8.6

#$ExcelFilePath = "C:\Users\kkane.MOA\Downloads\test-keywords.xlsx"
$ExcelFilePath = "C:\Users\kkane.MOA\Downloads\20231026_non_collection_images_catalog_export-keywords-only.xlsx"

# Import Excel data
$excelData = Import-Excel -Path $ExcelFilePath -WorksheetName Sheet1

$uniqueItems = [System.Collections.ArrayList]@()

foreach ($line in $excelData) {
    
    $KeywordsPipeDelimited = $line.Keywords #System.String ..."Keywords" is the A column heading from Excel in this case
    
    if ($KeywordsPipeDelimited -eq $null) {
        continue
    }

    # Split string by pipe
    $KeywordsList = $KeywordsPipeDelimited.Split("|")

    #Write-Host $Keywords # System.String[] of individual keywords

    foreach ($item in $KeywordsList) {
           
        # Discard if string contains...
        if (($item.Contains(".jpg")) -or 
            ($item.Contains(".jpeg")) -or 
            ($item.Contains(".tif")) -or 
            ($item.Contains(".JPG")) -or 
            ($item.Contains(".JPEG")) -or
            ($item.Contains(".TIF"))) {
            continue
        }

        # Add to list of unique items
        if ($UniqueItems -notcontains $item) {
            $UniqueItems.Add($item)
        }
    }
}

# Write out ArrayList to textfile
$UniqueItems | Out-File -Append C:\Users\kkane.MOA\Downloads\unique-keywords-output.txt
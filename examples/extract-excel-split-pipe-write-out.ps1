# Testing for CCiccone 10/26/2023
# 
# Requires ImportExcel module ->
# https://www.powershellgallery.com/packages/ImportExcel/7.8.6

$ExcelFilePath = "C:\Users\kkane.MOA\Downloads\test-keywords.xlsx"
#$ExcelFilePath = "C:\Users\kkane.MOA\Downloads\20231026_non_collection_images_catalog_export-keywords-only.xlsx"

$ExcelWorksheetName = "Sheet1"

# Import Excel data
$excelData = Import-Excel -Path $ExcelFilePath -WorksheetName $ExcelWorksheetName

# ArrayList for storing the data we want to grab
$uniqueItems = [System.Collections.ArrayList]@()

foreach ($row in $excelData) {
    
    # Print the keys of each line (should correspond with first row of Excel worksheet)
    # $row.PSObject.Properties | Select-Object -Expand Name

    # if property exists "Keywords"
    # ...in this case we know data of interest should be contained under this key
    if (Get-Member -inputobject $row -name "Keywords" -Membertype Properties) {
    
        $KeywordsPipeDelimited = $row.Keywords #System.String ..."Keywords" is the A column heading from Excel in this case
    
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
                [void]$UniqueItems.Add($item) # Cast to void to ignore return value from Add method (otherwise this prints the index to console, nbd)
            }

        }

    }

}

# Write out ArrayList to text file
$UniqueItems | Out-File -Append C:\Users\kkane.MOA\Downloads\unique-keywords-output.txt
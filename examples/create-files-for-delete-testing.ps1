$parentDirPath  = "C:\Users\kkane.MOA\Non-OneDrive\PowerShell\Test Directory"
$folderNames    = 1,2,3,4
$fileNames      = "foo","bar","baz", "etc"
$fileExtensions = "jpg", "png", "txt", "tif", "cr2", "dng"

Foreach ($i in $folderNames) {

    $basePath = "$parentDirPath\$i"
    $subDirs = "", "Data", "Trash"

    Foreach ($subDir in $subDirs) {
        
        # Create folders 
        # $parentDirPath\1
        # $parentDirPath\1\Data
        # $parentDirPath\1\Trash 
        # ...
        # $parentDirPath\4\Trash

        $folderExists = Test-Path -path "$parentDirPath\$i\$subDir"
        if (!$folderExists) {
           New-Item -Path $parentDirPath\$i -Name $subDir -ItemType "directory"
        }


        # Create .txt files within Data subdirectory
        if ($subDir -eq "Data") {
            
            Foreach ($j in $fileNames) {
                $fileExists = Test-Path -path "$parentDirPath\$i\$subDir\$j.txt"
                if (!$fileExists) {
                    New-Item -Path "$parentDirPath\$i\$subDir" -Name "$j.txt" -ItemType "file" -Value "some file data"
                }
            }

        }


        # Create random files within Trash subdirectory
        if ($subDir -eq "Trash") {
        
            Foreach ($j in $fileNames) {
                $fileExt = Get-Random -InputObject $fileExtensions
                $fileExists = Test-Path -path "$parentDirPath\$i\$subDir\$j.$fileExt"
                if (!$fileExists) {
                    New-Item -Path "$parentDirPath\$i\$subDir" -Name "$j.$fileExt" -ItemType "file" -Value "some file data"
                }    
            }
        
        }

    }

}


$targetFolder = "C:\Users\kkane.MOA\Non-OneDrive Docs\Node Projects\!projects\cloud-chambers-map\src\common\assets\images"
$shellApp = New-Object -ComObject 'shell.application'
$folderNamespace = $shellApp.Namespace($targetFolder)

Get-ChildItem -Path "$targetFolder\*" -Include '*.jpg','*.png' -File |
    ForEach-Object {
        $image = $folderNamespace.ParseName($_.Name)

        if($folderNamespace.GetDetailsOf($image, 31) -match '(?<width>\d+) x (?<height>\d+)') {
            [PsCustomObject]@{
                    Image      = $_.FullName
                    Width      = $Matches.width
                    Height     = $Matches.height
                    #IsPortrait = $([int]$Matches.height -gt [int]$Matches.width)
            }
        }
    }
# ---------------------------------------------------------------------
# 
# This script deletes files 
# with specified extensions            ($extFilters)
# within a specified parent directory  ($parentDirPath)
# 
#
# Using these default aliases
#
# Where == Where-Object
# %     == ForEach-Object
#
# ---------------------------------------------------------------------


# Setup - Variables ---------------------------------------------------

$parentDirPath      = "C:\Users\kkane.MOA\Non-OneDrive\PowerShell\Test Directory\*\Trash"
$extFilters         = @('.3fr',
                        '.ari', 
                        '.arw',
                        '.bay',
                        '.braw', 
                        '.crw', 
                        '.cr2', 
                        '.cr3',
                        '.cap',
                        '.data', 
                        '.dcs', 
                        '.dcr', 
                        '.dng',
                        '.drf',
                        '.eip', 
                        '.erf',
                        '.fff',
                        '.gpr',
                        '.iiq',
                        '.k25', 
                        '.kdc',
                        '.mdc', 
                        '.mef', 
                        '.mos', 
                        '.mrw',
                        '.nef', 
                        '.nrw',
                        '.obm', 
                        '.orf',
                        '.pef', 
                        '.ptx', 
                        '.pxn',
                        '.r3d', 
                        '.raf', 
                        '.raw', 
                        '.rwl', 
                        '.rw2', 
                        '.rwz',
                        '.sr2', 
                        '.srf', 
                        '.srw',
                        '.tif',
                        '.x3f')
$deletePaths        = @()
$extFiltersWildcard = @()


# Setup - Functions ---------------------------------------------------

function Initialize-Delete-Script {
    Instructions
}

function Instructions {
    # User Instructions

    Write-Host "This script will find all items in Capture One ...\**Project Name**\Trash directories for deletion."
    Write-Host "The file extensions to be deleted include:"
    Write-Host "" # Print blank line
    $extFilters | % { Write-Host $_ }
    Write-Host "" # Print blank line
    $userResponse = Read-Host "Proceed? Type 'ok' to continue"
    
    switch ($userResponse)
    {
        "ok" { LaunchFindDeleteProcess }
        default { ExitScript } 
    }
}

function FindPaths {

    # Find all paths to delete

    # Get-ChildItem Method
    #Get-ChildItem $parentDirPath -Recurse | Where {$extFilters -contains $_.extension} | % { $deletePaths += $_.FullName }

    # Resolve-Path Method
    # Faster than Get-ChildItem because doesn't read all the extra data that Get-ChildItem does
    
    # Need to prepend a wildcard on each extension ('.jpg' , '.png', '.tif') -> ('*.jpg' , '*.png', '*.tif')
    $extFilters | % { 
        $item = -join("*", $_)
        $extFiltersWildcard += $item
    }

    $extFiltersWildcard | % { Join-Path $parentDirPath $_ } | Resolve-Path | % { $deletePaths += $_ }
    
    $deletePaths # return this (this is how PowerShell function returns work)
}

function DeletePaths {
    try {
        $deletePaths | % { Remove-Item -Path $_ -Force }
        Write-Host "All files deleted successfully."
    }
    catch {
        Write-Host "An error occurred. Is any file locked for editing?"
    }
}

function ExitScript {
    Write-Host "Exiting"
    Exit
}

function LaunchFindDeleteProcess {
    Write-Host "" # Print blank line

    $deletePaths = FindPaths # Find paths for deletion
    $deletePaths | % { Write-Host $_ } # Print paths for deletion
    $totalToDelete = $deletePaths.length

    Write-Host "" # Print blank line

    if ($totalToDelete -eq 0) { 
        Write-Host "No files were found to delete. Exiting."
        return 
    }
    
    # User confirmation
    
    $userResponse = Read-Host "Proceed with deleting $totalToDelete files? Type 'permanently delete' to continue"
    
    switch ($userResponse)
    {
        "permanently delete" { DeletePaths }
        default { ExitScript } 
    }

}


# Init / Execute ------------------------------------------------------

Initialize-Delete-Script
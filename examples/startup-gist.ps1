# Config  ---------------------------------------------------------
# Must specify exactly one filepath and one program to run! -------
# -----------------------------------------------------------------

# $FilePath = 'C:\Users\Username\Desktop\Path\To\executable.exe'
# $FilePath = 'C:\Users\Username\Desktop\Path\To\video.mp4' 
$FilePath = 'file:///C:/Users/kkane.MOA/Downloads/mockup-still-009.png'

# $ProgramToRun = 'executable'
# $ProgramToRun = 'mpc'
# $ProgramToRun = 'vlc'
$ProgramToRun = 'chrome'
# $ProgramToRun = 'edge'


# -----------------------------------------------------------------
# Do not edit below - unless you are familiar with PowerShell -----
# -----------------------------------------------------------------

$mpc_exe_path = 'C:\Path\To\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe'
# $vlc_exe_path = 'C:\Program Files\VideoLAN\VLC\vlc.exe'
$vlc_exe_path = 'C:\Program Files (x86)\VideoLAN\VLC\vlc.exe'
$chrome_exe_path = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$edge_exe_path = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'

Write-Host $ProgramToRun $

Switch ($ProgramToRun)
{
    "executable" 
    {
        & $FilePath
    }
    "mpc" 
    {
        & $mpc_exe_path /fullscreen $FilePath
    }
    "vlc" 
    {  
        & $vlc_exe_path --video-on-top --no-video-deco --fullscreen --no-autoscale --loop --no-video-title $FilePath
    }
    "chrome" 
    {  
        & $chrome_exe_path --start-fullscreen $FilePath
    }
    "edge" 
    {  
        # For msedge.exe --start-fullscreen switch to work, open Edge -> 3 dots (hamburger menu) -> Settings -> System and Performance -> Disable 'Startup boos't & Disable 'Continue running background extensions and apps when Microsoft Edge is closed'
        & $edge_exe_path --start-fullscreen $FilePath
    }
    default
    {
        Write-Host 'Default block executed, are you sure your $ProgramToRun string is correct?'
        Start-Sleep -Seconds 5
    }
}
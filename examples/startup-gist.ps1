# Config  ---------------------------------------------------------
# Must specify exactly one filepath and one program to run! -------
# -----------------------------------------------------------------

# $FilePath = 'C:\Users\Username\Desktop\Path\To\executable.exe'
$FilePath = 'C:\Users\Username\Desktop\Path\To\video.mp4' 

# $ProgramToRun = 'executable'
# $ProgramToRun = 'mpc'
$ProgramToRun = 'vlc'



# -----------------------------------------------------------------
# Do not edit below here ------------------------------------------
# -----------------------------------------------------------------

$mpc_exe_path = 'C:\Path\To\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe'
# $vlc_exe_path = 'C:\Program Files\VideoLAN\VLC\vlc.exe'
$vlc_exe_path = 'C:\Program Files (x86)\VideoLAN\VLC\vlc.exe'

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
    default
    {
        Write-Host 'Default block executed, are you sure your $ProgramToRun string is correct?'
        Start-Sleep -Seconds 5
    }
}
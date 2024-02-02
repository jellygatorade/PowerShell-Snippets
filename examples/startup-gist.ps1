# -----------------------------------------------------------------
# Copied notes, not currently tested 2/2/2024 ---------------------
# -----------------------------------------------------------------

# $WeWant = "executable"
# $WeWant = "mpc"
$WeWant = "vlc"

Switch ($WeWant)
{
    "executable" 
    {
	    cd C:\Users\Username\Desktop\Path\To\
	    .\executable.exe

        # or
        # & "C:\Users\Username\Desktop\Path\To\executable.exe"
    }
    "mpc" 
    {
        & "C:\Path\To\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe" "/fullscreen" "C:\Users\Username\Desktop\video-filename.mp4"
    }
    "vlc" 
    {
        & "C:\Path\To\VideoLAN\VLC\vlc.exe"  "--video-on-top --no-video-deco --fullscreen --no-autoscale --loop --no-video-title" "C:\Users\Username\Desktop\video-filename.mp4" 
    }
}
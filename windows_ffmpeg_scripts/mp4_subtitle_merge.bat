@echo off
setlocal enabledelayedexpansion

echo Searching for MP4 files in: %cd%
if not exist "output" mkdir output

for %%F in (*.mp4) do (
    set "VIDEO=%%F"
    set "NAME=%%~nF"
    set "SUB=%%~nF.srt"
    set "OUT=%%~nF_sub.mp4"
    
    echo "!SUB!"
    if exist "!SUB!" (
        echo ffmpeg -i "!VIDEO!" -i "!SUB!" -c copy -c:s -c copy -c:s mov_text "!OUT!"
	ffmpeg -i "!VIDEO!" -i "!SUB!" -c copy -c:s mov_text -metadata:s:s:0 language=eng "output\!OUT!"
    ) else (
        echo REM No subtitle found for !VIDEO!
    )
)

echo.
echo Done.
pause

@echo off
setlocal EnableDelayedExpansion

REM ===== CONFIG =====
set "VIDEO_DIR=D:\Downloads\AAC"
set "AUDIO_DIR=D:\Downloads\DTS"
set "OUT_DIR=D:\Downloads"
set "MKVMERGE=C:\Program Files\MKVToolNix\mkvmerge.exe"
REM ==================

for /f "delims=" %%F in ('
    dir "%VIDEO_DIR%\*.mp4" /s /b /o:n
') do (
    set "VIDEO_FILE=%%F"
    set "NAME=%%~nxF"
    set "AUDIO_FILE=%AUDIO_DIR%\!NAME!"

    if exist "!AUDIO_FILE!" (

        ffmpeg -y ^
            -i "%%F" ^
            -i "!AUDIO_FILE!" ^
            -map 0:v ^
            -map 0:a? ^
            -map 1:a ^
            -map 0:s? ^
            -map_metadata 0 ^
            -c copy ^
            "%OUT_DIR%\%%~nF.mp4"

        if !errorlevel! equ 0 (
            del "%%F"
            del "!AUDIO_FILE!"
        ) else (
            echo Failed to process: %%~nF
        )

    ) else (
        echo Missing audio: !NAME!
    )
)

del "%~f0"
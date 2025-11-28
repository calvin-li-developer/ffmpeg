@echo off
setlocal

REM Convert all FLAC files to 320kbps MP3

for %%a in ("*.flac") do (
    echo Converting: %%a
    ffmpeg -i "%%a" -codec:a libmp3lame -b:a 320k -map_metadata 0 -id3v2_version 3 "%%~na.mp3"
    
    REM If MP3 was created successfully, delete original FLAC
    if exist "%%~na.mp3" (
        echo Deleting original FLAC: %%a
        del "%%a"
    ) else (
        echo Conversion failed for %%a — FLAC NOT deleted.
    )
)

del "%~f0"

endlocal

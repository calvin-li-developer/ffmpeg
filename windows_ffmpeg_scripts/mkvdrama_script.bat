@echo off
setlocal enabledelayedexpansion
if not exist "output" mkdir output

for %%F in (*.mkv) do (
  ffmpeg -i "%%F" -c:v copy -c:a copy -metadata title="" -metadata:s:a language=chi -c:s mov_text -map 0 -map_metadata 0 -movflags +faststart "output/%%~nF.mp4" || (
    echo An error occurred during processing. Exiting script.
    exit /b 1
  )
)


move /y "output\*" "./"
rmdir /s /q "output"
del /q *.mkv
del "%~f0"
endlocal


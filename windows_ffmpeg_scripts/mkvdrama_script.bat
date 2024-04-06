@echo off
setlocal enabledelayedexpansion
if not exist "output" mkdir output
set i=0

for %%F in (*.mkv) do (
  set /a i+=1
  ffmpeg -i "%%F" -c:v copy -c:a copy -metadata title="Episode !i!" -metadata:s:a:0 language=chi -c:s mov_text -map 0 -movflags +faststart "output/%%~nF.mp4" || (
    echo An error occurred during processing. Exiting script.
    exit /b 1
  )
)


move /y "output\*" "./"
rmdir /s /q "output"
del /q *.mkv
endlocal

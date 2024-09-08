@echo off
setlocal enabledelayedexpansion
if not exist "output" mkdir output

set i=0

for %%A IN (*.mp4) DO (
	set /a i+=1 
	ffmpeg -i "%%A" -c copy -metadata:s:a:0 language=jpn -metadata title="Episode !i!" -movflags +faststart "output/%%A" || pause
)
move /y "output\*" "./"
rmdir /s /q "output"
del "%~f0"
endlocal
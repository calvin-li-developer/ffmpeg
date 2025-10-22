@echo off
if not exist "output" mkdir output
for %%A in (*.m*) do (
    ffmpeg -i "%%A" -map 0 -map -0:t -c:v copy -c:a copy -c:s mov_text -movflags +faststart "output/%%~nA.mp4"
)
move /y "output\*" "./"
rmdir /s /q "output"

for %%i in (*.mkv) DO (
    del "%%i"

)
del "%~f0"


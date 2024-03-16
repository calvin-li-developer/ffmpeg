if not exist "output" mkdir output
for %%A IN (*.m*) DO ffmpeg -i "%%A" -c:v copy -c:a copy -movflags +faststart "output/%%~nA.mp4"
move /y "output\*" "./"
rmdir /s /q "output"

for %%i in (*.mkv) DO (
    del "%%i"
)
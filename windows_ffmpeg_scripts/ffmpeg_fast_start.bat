if not exist "output" mkdir output
for %%A IN (*.mp4) DO ffmpeg -i "%%A" -c copy -map 0 -movflags +faststart "output/%%A"
move /y "output\*" "./"
rmdir /s /q "output"
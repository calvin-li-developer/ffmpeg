if not exist "output" mkdir output
for %%A IN (*.mp4) DO ffmpeg -i "%%A" -c copy -metadata:s:a:0 language=jpn -movflags +faststart "output/%%A"
move /y "output\*" "./"
rmdir /s /q "output"
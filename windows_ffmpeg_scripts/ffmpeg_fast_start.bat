if not exist "output" mkdir output
for %%A IN (*) DO ffmpeg -i "%%A" -c copy -map 0 -metadata title="" -movflags +faststart "output/%%A"
move /y "output\*" "./"
rmdir /s /q "output"
del "%~f0"

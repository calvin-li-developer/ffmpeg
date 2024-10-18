if not exist "output" mkdir output

for %%A IN (*.m4b) DO (
    ffmpeg -i "%%A" -codec:a libmp3lame -q:a 0 -map_metadata 0 "output/%%~nA.mp3"
)

move /y "output\*" "./"
rmdir /s /q "output"
del "%~f0"

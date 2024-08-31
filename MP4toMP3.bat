setlocal enabledelayedexpansion

:: 检查ffmpeg是否可用
ffmpeg -version >nul 2>&1
if errorlevel 1 (
    echo ffmpeg not found. Please install ffmpeg and add it to your PATH.
    exit /b 1
)

:: 转换.mp4文件为.mp3
for %%F in (*.mp4) do (
    set "filename=%%~nF"
    echo Converting !filename!.mp4 to !filename!.mp3
    ffmpeg -i "%%F" -q:a 0 -map a "!filename!.mp3"
)

echo Conversion completed.
endlocal

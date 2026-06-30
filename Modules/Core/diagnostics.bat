@echo off

:: ==========================================
:: Diagnostics Module
:: ==========================================

cls

echo ==========================================
echo         STARTUP DIAGNOSTICS
echo ==========================================
echo.

:: ------------------------------------------
:: yt-dlp
:: ------------------------------------------

where yt-dlp >nul 2>nul

if %ERRORLEVEL% EQU 0 (
    echo [✓] yt-dlp..............Installed
) else (
    echo [X] yt-dlp..............Missing
)

:: ------------------------------------------
:: FFmpeg
:: ------------------------------------------

where ffmpeg >nul 2>nul

if %ERRORLEVEL% EQU 0 (
    echo [✓] FFmpeg..............Installed
) else (
    echo [X] FFmpeg..............Missing
)

:: ------------------------------------------
:: Config
:: ------------------------------------------

if exist "%CONFIG%" (
    echo [✓] Config..............Loaded
) else (
    echo [X] Config..............Missing
)

:: ------------------------------------------
:: Downloads
:: ------------------------------------------

if exist "%DOWNLOADS%" (
    echo [✓] Downloads Folder....Ready
) else (
    echo [X] Downloads Folder....Missing
)

:: ------------------------------------------
:: Logs
:: ------------------------------------------

if exist "%LOGS%" (
    echo [✓] Logs Folder.........Ready
) else (
    echo [X] Logs Folder.........Missing
)

:: ------------------------------------------
:: Temp
:: ------------------------------------------

if exist "%TEMP%" (
    echo [✓] Temp Folder.........Ready
) else (
    echo [X] Temp Folder.........Missing
)

:: ------------------------------------------
:: Banner Module
:: ------------------------------------------

if exist "%BANNER_MODULE%" (
    echo [✓] Banner Module.......Loaded
) else (
    echo [X] Banner Module.......Missing
)

:: ------------------------------------------
:: Menu Module
:: ------------------------------------------

if exist "%MENU_MODULE%" (
    echo [✓] Menu Module.........Loaded
) else (
    echo [X] Menu Module.........Missing
)

echo.
echo ==========================================
echo Diagnostics Completed
echo ==========================================

timeout /t 2 >nul

exit /b
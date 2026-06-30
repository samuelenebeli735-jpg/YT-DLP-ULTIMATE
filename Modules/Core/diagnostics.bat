@echo off
cls

echo ==========================================
echo        Running System Diagnostics
echo ==========================================
echo.

:: ------------------------------------------
:: Check yt-dlp
:: ------------------------------------------

where yt-dlp >nul 2>&1

if %errorlevel%==0 (
    echo [PASS] yt-dlp found.
) else (
    echo [FAIL] yt-dlp not found.
    echo.
    echo Please install yt-dlp before continuing.
    pause
    exit /b 1
)

:: ------------------------------------------
:: Check FFmpeg
:: ------------------------------------------

where ffmpeg >nul 2>&1

if %errorlevel%==0 (
    echo [PASS] FFmpeg found.
) else (
    echo [FAIL] FFmpeg not found.
    echo.
    echo Please install FFmpeg before continuing.
    pause
    exit /b 1
)

:: ------------------------------------------
:: Check Downloads Folder
:: ------------------------------------------

if exist "%DOWNLOADS%" (
    echo [PASS] Downloads folder found.
) else (
    echo [FAIL] Downloads folder missing.
    mkdir "%DOWNLOADS%"
    echo [INFO] Downloads folder created.
)

:: ------------------------------------------
:: Check Logs Folder
:: ------------------------------------------

if exist "%LOGS%" (
    echo [PASS] Logs folder found.
) else (
    echo [FAIL] Logs folder missing.
    mkdir "%LOGS%"
    echo [INFO] Logs folder created.
)

:: ------------------------------------------
:: Check Temp Folder
:: ------------------------------------------

if exist "%TEMP%" (
    echo [PASS] Temp folder found.
) else (
    echo [FAIL] Temp folder missing.
    mkdir "%TEMP%"
    echo [INFO] Temp folder created.
)

echo.
echo ==========================================
echo Diagnostics Complete
echo ==========================================
echo.

timeout /t 2 >nul

exit /b 0
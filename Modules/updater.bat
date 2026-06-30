@echo off

:: ==========================================
:: Updater Module
:: ==========================================

:UpdaterMenu

cls

call "%BANNER_MODULE%"

echo ==========================================
echo            YT-DLP UPDATER
echo ==========================================
echo.
echo 1. Check Installed Version
echo 2. Update yt-dlp
echo 3. Back
echo.
echo ==========================================

set "UPDATE_OPTION="
set /p UPDATE_OPTION=Select an option:

if "%UPDATE_OPTION%"=="1" goto Version
if "%UPDATE_OPTION%"=="2" goto Update
if "%UPDATE_OPTION%"=="3" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto UpdaterMenu


:Version

cls

call "%BANNER_MODULE%"

echo ==========================================
echo         INSTALLED VERSION
echo ==========================================
echo.

yt-dlp --version

echo.
pause

goto UpdaterMenu


:Update

cls

call "%BANNER_MODULE%"

echo ==========================================
echo          UPDATING YT-DLP
echo ==========================================
echo.

yt-dlp -U

echo.

if %ERRORLEVEL% EQU 0 (
    echo Update completed successfully.
) else (
    echo Update failed.
)

echo.
pause

goto UpdaterMenu
@echo off

:: ==========================================
:: Main Menu Module
:: ==========================================

:Menu

echo ==========================================
echo              MAIN MENU
echo ==========================================
echo.
echo 1. Download Video
echo 2. Download Audio
echo 3. Download Playlist
echo 4. List Available Formats
echo 5. Settings
echo 6. Download History
echo 7. Browser Tools
echo 8. Update yt-dlp
echo 9. Exit
echo.
echo ==========================================

set "MENU_OPTION="

set /p MENU_OPTION=Select an option: 

:: ------------------------------------------
:: Validate Input
:: ------------------------------------------

if "%MENU_OPTION%"=="1" exit /b
if "%MENU_OPTION%"=="2" exit /b
if "%MENU_OPTION%"=="3" exit /b
if "%MENU_OPTION%"=="4" exit /b
if "%MENU_OPTION%"=="5" exit /b
if "%MENU_OPTION%"=="6" exit /b
if "%MENU_OPTION%"=="7" exit /b
if "%MENU_OPTION%"=="8" exit /b
if "%MENU_OPTION%"=="9" exit /b

echo.
echo Invalid option!
echo Please try again.
echo.

timeout /t 2 >nul

cls

call "%BANNER_MODULE%"

goto Menu
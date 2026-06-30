@echo off

:: ==========================================
:: Settings Module
:: ==========================================

:SettingsMenu

cls

call "%BANNER_MODULE%"

echo ==========================================
echo               SETTINGS
echo ==========================================
echo.
echo 1. Change Download Folder
echo 2. Change Default Quality
echo 3. Toggle Cookies
echo 4. Toggle Auto Update
echo 5. Back
echo.
echo ------------------------------------------
echo Current Settings
echo ------------------------------------------
echo Download Folder : %DOWNLOAD_FOLDER%
echo Default Quality : %DEFAULT_QUALITY%
echo Cookies Enabled : %COOKIES_ENABLED%
echo Auto Update     : %AUTO_UPDATE%
echo ==========================================
echo.

set "SETTINGS_OPTION="
set /p SETTINGS_OPTION=Select an option:

if "%SETTINGS_OPTION%"=="1" goto ChangeFolder
if "%SETTINGS_OPTION%"=="2" goto ChangeQuality
if "%SETTINGS_OPTION%"=="3" goto ToggleCookies
if "%SETTINGS_OPTION%"=="4" goto ToggleUpdates
if "%SETTINGS_OPTION%"=="5" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto SettingsMenu


:ChangeFolder
cls
echo Current Folder:
echo %DOWNLOAD_FOLDER%
echo.

set /p NEW_FOLDER=Enter new download folder:

if not defined NEW_FOLDER goto SettingsMenu

set "DOWNLOAD_FOLDER=%NEW_FOLDER%"

call "%CONFIG_MODULE%" :SaveConfig

echo.
echo Download folder updated.
timeout /t 2 >nul
goto SettingsMenu


:ChangeQuality
cls

echo Select Default Quality
echo.
echo 1. Best
echo 2. 720
echo 3. 1080
echo 4. 2160
echo.

set /p QUALITY=Choice:

if "%QUALITY%"=="1" set "DEFAULT_QUALITY=best"
if "%QUALITY%"=="2" set "DEFAULT_QUALITY=720"
if "%QUALITY%"=="3" set "DEFAULT_QUALITY=1080"
if "%QUALITY%"=="4" set "DEFAULT_QUALITY=2160"

call "%CONFIG_MODULE%" :SaveConfig

echo.
echo Default quality updated.
timeout /t 2 >nul
goto SettingsMenu


:ToggleCookies

if "%COOKIES_ENABLED%"=="1" (
    set "COOKIES_ENABLED=0"
) else (
    set "COOKIES_ENABLED=1"
)

call "%CONFIG_MODULE%" :SaveConfig

echo.
echo Cookies setting updated.
timeout /t 2 >nul
goto SettingsMenu


:ToggleUpdates

if "%AUTO_UPDATE%"=="1" (
    set "AUTO_UPDATE=0"
) else (
    set "AUTO_UPDATE=1"
)

call "%CONFIG_MODULE%" :SaveConfig

echo.
echo Auto Update setting updated.
timeout /t 2 >nul
goto SettingsMenu
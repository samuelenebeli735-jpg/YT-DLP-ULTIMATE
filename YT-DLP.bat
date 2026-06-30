@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ==========================================
:: YT-DLP Ultimate
:: Main Launcher
:: ==========================================

title YT-DLP Ultimate
color 0A

:: ------------------------------------------
:: Application Paths
:: ------------------------------------------

set "ROOT=%~dp0"

set "ASSETS=%ROOT%Assets"
set "MODULES=%ROOT%Modules"

set "CORE=%MODULES%\Core"
set "DOWNLOAD=%MODULES%\Download"
set "UI=%MODULES%\UI"

set "DOWNLOADS=%ROOT%Downloads"
set "LOGS=%ROOT%Logs"
set "TEMP=%ROOT%Temp"

set "CONFIG=%ROOT%config.ini"

:: ------------------------------------------
:: Module Paths
:: ------------------------------------------

set "CONFIG_MODULE=%CORE%\config.bat"
set "DIAGNOSTICS_MODULE=%CORE%\diagnostics.bat"

set "MENU_MODULE=%UI%\menu.bat"
set "BANNER_MODULE=%UI%\banner.bat"
set "SETTINGS_MODULE=%UI%\settings.bat"

set "DOWNLOAD_MODULE=%DOWNLOAD%\download.bat"
set "AUDIO_MODULE=%DOWNLOAD%\audio.bat"
set "PLAYLIST_MODULE=%DOWNLOAD%\playlist.bat"
set "FORMATS_MODULE=%DOWNLOAD%\formats.bat"

set "HISTORY_MODULE=%MODULES%\history.bat"
set "BROWSER_MODULE=%MODULES%\browser.bat"
set "UPDATER_MODULE=%MODULES%\updater.bat"

:: ------------------------------------------
:: Create Required Folders
:: ------------------------------------------

if not exist "%DOWNLOADS%" mkdir "%DOWNLOADS%"
if not exist "%LOGS%" mkdir "%LOGS%"
if not exist "%TEMP%" mkdir "%TEMP%"

:: ------------------------------------------
:: Load Configuration
:: ------------------------------------------

call "%CONFIG_MODULE%"

:: ------------------------------------------
:: Run Diagnostics
:: ------------------------------------------

call "%DIAGNOSTICS_MODULE%"

:: ------------------------------------------
:: Main Application Loop
:: ------------------------------------------

:MainLoop

cls

call "%BANNER_MODULE%"

call "%MENU_MODULE%"

:: ------------------------------------------
:: Route Menu Selection
:: ------------------------------------------

if "%MENU_OPTION%"=="1" call "%DOWNLOAD_MODULE%"

if "%MENU_OPTION%"=="2" call "%AUDIO_MODULE%"

if "%MENU_OPTION%"=="3" call "%PLAYLIST_MODULE%"

if "%MENU_OPTION%"=="4" call "%FORMATS_MODULE%"

if "%MENU_OPTION%"=="5" call "%SETTINGS_MODULE%"

if "%MENU_OPTION%"=="6" call "%HISTORY_MODULE%"

if "%MENU_OPTION%"=="7" call "%BROWSER_MODULE%"

if "%MENU_OPTION%"=="8" call "%UPDATER_MODULE%"

if "%MENU_OPTION%"=="9" goto Exit

goto MainLoop

:Exit
cls
echo.
echo Thank you for using YT-DLP Ultimate.
echo.
timeout /t 2 >nul
exit
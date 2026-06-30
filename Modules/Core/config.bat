@echo off
goto :LoadConfig

:: ==========================================
:: CONFIG MODULE
:: ==========================================

:CreateDefaultConfig
(
echo # ===================================
echo # YT-DLP Ultimate Configuration
echo # ===================================
echo.
echo [GENERAL]
echo VERSION=1.0
echo THEME=Green
echo LANGUAGE=en
echo.
echo [DOWNLOAD]
echo DOWNLOAD_FOLDER=Downloads
echo DEFAULT_QUALITY=720
echo OVERWRITE=0
echo.
echo [COOKIES]
echo COOKIES_ENABLED=0
echo COOKIES_FILE=cookies.txt
echo.
echo [LOGGING]
echo LOGGING_ENABLED=1
echo LOG_FILE=Logs\history.log
echo.
echo [UPDATES]
echo AUTO_UPDATE=1
)>"%CONFIG%"
exit /b


:LoadConfig

:: Create config if missing
if not exist "%CONFIG%" (
    call :CreateDefaultConfig
)

:: Clear previous values
set "VERSION="
set "THEME="
set "LANGUAGE="

set "DOWNLOAD_FOLDER="
set "DEFAULT_QUALITY="
set "OVERWRITE="

set "COOKIES_ENABLED="
set "COOKIES_FILE="

set "LOGGING_ENABLED="
set "LOG_FILE="

set "AUTO_UPDATE="

:: Read config.ini
for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG%") do (

    if "%%A"=="VERSION" set "VERSION=%%B"
    if "%%A"=="THEME" set "THEME=%%B"
    if "%%A"=="LANGUAGE" set "LANGUAGE=%%B"

    if "%%A"=="DOWNLOAD_FOLDER" set "DOWNLOAD_FOLDER=%%B"
    if "%%A"=="DEFAULT_QUALITY" set "DEFAULT_QUALITY=%%B"
    if "%%A"=="OVERWRITE" set "OVERWRITE=%%B"

    if "%%A"=="COOKIES_ENABLED" set "COOKIES_ENABLED=%%B"
    if "%%A"=="COOKIES_FILE" set "COOKIES_FILE=%%B"

    if "%%A"=="LOGGING_ENABLED" set "LOGGING_ENABLED=%%B"
    if "%%A"=="LOG_FILE" set "LOG_FILE=%%B"

    if "%%A"=="AUTO_UPDATE" set "AUTO_UPDATE=%%B"
)

exit /b


:SaveConfig

(
echo # ===================================
echo # YT-DLP Ultimate Configuration
echo # ===================================
echo.
echo [GENERAL]
echo VERSION=%VERSION%
echo THEME=%THEME%
echo LANGUAGE=%LANGUAGE%
echo.
echo [DOWNLOAD]
echo DOWNLOAD_FOLDER=%DOWNLOAD_FOLDER%
echo DEFAULT_QUALITY=%DEFAULT_QUALITY%
echo OVERWRITE=%OVERWRITE%
echo.
echo [COOKIES]
echo COOKIES_ENABLED=%COOKIES_ENABLED%
echo COOKIES_FILE=%COOKIES_FILE%
echo.
echo [LOGGING]
echo LOGGING_ENABLED=%LOGGING_ENABLED%
echo LOG_FILE=%LOG_FILE%
echo.
echo [UPDATES]
echo AUTO_UPDATE=%AUTO_UPDATE%
)>"%CONFIG%"

exit /b
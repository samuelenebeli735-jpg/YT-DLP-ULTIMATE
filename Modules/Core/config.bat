@echo off

:: ==========================================
:: Configuration Loader
:: ==========================================

if /I "%~1"==":SaveConfig" goto SaveConfig
goto LoadConfig

:LoadConfig

if not exist "%CONFIG%" (
    echo.
    echo ERROR:
    echo config.ini was not found.
    echo.
    pause
    exit /b 1
)

:: ------------------------------------------
:: Read configuration
:: ------------------------------------------

for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG%") do (

    if not "%%A"=="" (
        if not "%%A:~0,1%%"=="#" (
            if not "%%A:~0,1%%"=="[" (
                set "%%A=%%B"
            )
        )
    )

)

:: ------------------------------------------
:: Expands relative paths
:: ------------------------------------------

if /I "%DOWNLOAD_FOLDER%"=="Downloads" (
    set "DOWNLOAD_FOLDER=%ROOT%Downloads"
)

if /I "%LOG_FILE%"=="Logs\history.log" (
    set "LOG_FILE=%ROOT%Logs\history.log"
)

if /I "%COOKIES_FILE%"=="cookies.txt" (
    set "COOKIES_FILE=%ROOT%cookies.txt"
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
) >"%CONFIG%"

exit /b
@echo off

:: ==========================================
:: Configuration Loader
:: ==========================================

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
:: Expand relative paths
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
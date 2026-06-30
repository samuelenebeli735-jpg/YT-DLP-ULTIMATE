@echo off

:: ==========================================
:: Logger Module
:: ==========================================

goto :eof


:Log

:: Usage:
:: call "%LOGGER_MODULE%" :Log "TYPE" "STATUS" "URL"

set "LOG_TYPE=%~2"
set "LOG_STATUS=%~3"
set "LOG_URL=%~4"

if not exist "%LOGS%" (
    mkdir "%LOGS%"
)

(
echo =====================================================
echo Date    : %DATE%
echo Time    : %TIME%
echo Type    : %LOG_TYPE%
echo Status  : %LOG_STATUS%
echo URL     : %LOG_URL%
echo =====================================================
echo.
)>>"%LOGS%\history.log"

exit /b
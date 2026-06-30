@echo off

:: ==========================================
:: Banner Module
:: ==========================================

if exist "%ASSETS%\banner.txt" (
    type "%ASSETS%\banner.txt"
) else (
    echo ==========================================
    echo            YT-DLP ULTIMATE
    echo ==========================================
)

echo.

exit /b
@echo off

:HistoryMenu

cls
call "%BANNER_MODULE%"

echo ==========================================
echo           DOWNLOAD HISTORY
echo ==========================================
echo.
echo [1] View History
echo [2] Clear History
echo [3] Open History File
echo [4] Back
echo.
echo ==========================================

set "HISTORY_OPTION="
set /p HISTORY_OPTION=Select an option:

if "%HISTORY_OPTION%"=="1" goto View
if "%HISTORY_OPTION%"=="2" goto Clear
if "%HISTORY_OPTION%"=="3" goto Open
if "%HISTORY_OPTION%"=="4" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto HistoryMenu


:View

cls
call "%BANNER_MODULE%"

echo ==========================================
echo              HISTORY LOG
echo ==========================================
echo.

if exist "%LOGS%\history.log" (
    type "%LOGS%\history.log"
) else (
    echo No download history found.
)

echo.
pause
goto HistoryMenu


:Clear

cls
call "%BANNER_MODULE%"

echo ==========================================
echo            CLEAR HISTORY
echo ==========================================
echo.

choice /C YN /M "Are you sure"

if errorlevel 2 goto HistoryMenu

if exist "%LOGS%\history.log" (
    del "%LOGS%\history.log"
    echo.
    echo History cleared successfully.
) else (
    echo.
    echo No history file found.
)

echo.
pause
goto HistoryMenu


:Open

if exist "%LOGS%\history.log" (
    start "" notepad "%LOGS%\history.log"
) else (
    echo.
    echo No history file found.
    pause
)

goto HistoryMenu
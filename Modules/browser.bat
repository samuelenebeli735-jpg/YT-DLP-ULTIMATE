@echo off

:: ==========================================
:: Browser Module
:: ==========================================

:BrowserMenu

cls

call "%BANNER_MODULE%"

echo ==========================================
echo            BROWSER TOOLS
echo ==========================================
echo.
echo 1. Check Installed Browsers
echo 2. Cookies Status
echo 3. Open Cookies Folder
echo 4. Back
echo.
echo ==========================================

set "BROWSER_OPTION="
set /p BROWSER_OPTION=Select an option:

if "%BROWSER_OPTION%"=="1" goto CheckBrowsers
if "%BROWSER_OPTION%"=="2" goto CookieStatus
if "%BROWSER_OPTION%"=="3" goto OpenCookies
if "%BROWSER_OPTION%"=="4" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto BrowserMenu


:CheckBrowsers

cls

call "%BANNER_MODULE%"

echo ==========================================
echo        INSTALLED BROWSERS
echo ==========================================
echo.

if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
    echo [FOUND] Microsoft Edge
) else (
    echo [MISSING] Microsoft Edge
)

if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    echo [FOUND] Google Chrome
) else (
    echo [MISSING] Google Chrome
)

if exist "%ProgramFiles%\Mozilla Firefox\firefox.exe" (
    echo [FOUND] Mozilla Firefox
) else (
    echo [MISSING] Mozilla Firefox
)

if exist "%ProgramFiles%\BraveSoftware\Brave-Browser\Application\brave.exe" (
    echo [FOUND] Brave Browser
) else (
    echo [MISSING] Brave Browser
)

echo.
pause
goto BrowserMenu


:CookieStatus

cls

call "%BANNER_MODULE%"

echo ==========================================
echo           COOKIE STATUS
echo ==========================================
echo.

echo Cookies Enabled : %COOKIES_ENABLED%
echo Cookies File    : %COOKIES_FILE%
echo.

if exist "%COOKIES_FILE%" (
    echo Status : FOUND
) else (
    echo Status : NOT FOUND
)

echo.
pause
goto BrowserMenu


:OpenCookies

cls

if exist "%COOKIES_FILE%" (

    explorer /select,"%COOKIES_FILE%"

) else (

    echo Cookies file not found.
    echo.
    pause

)

goto BrowserMenu
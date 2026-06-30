@echo off

:: ==========================================
:: Format Tools Module
:: ==========================================

:FormatsMenu

cls
call "%BANNER_MODULE%"

echo ==========================================
echo            FORMAT TOOLS
echo ==========================================
echo.
echo [1] List Available Formats
echo [2] Download by Format ID
echo [3] Back
echo.
echo ==========================================

set "FORMAT_OPTION="
set /p FORMAT_OPTION=Select an option:

if "%FORMAT_OPTION%"=="1" goto ListFormats
if "%FORMAT_OPTION%"=="2" goto DownloadFormat
if "%FORMAT_OPTION%"=="3" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto FormatsMenu


:: ==========================================
:: Ask URL
:: ==========================================

:AskURL

cls
call "%BANNER_MODULE%"

echo ==========================================
echo          ENTER VIDEO URL
echo ==========================================
echo.

set "VIDEO_URL="
set /p VIDEO_URL=URL:

if not defined VIDEO_URL (
    echo.
    echo URL cannot be empty.
    timeout /t 2 >nul
    goto FormatsMenu
)

exit /b


:: ==========================================
:: List Formats
:: ==========================================

:ListFormats

call :AskURL

echo.
echo Retrieving available formats...
echo.

yt-dlp -F "%VIDEO_URL%"

if %ERRORLEVEL% EQU 0 (

    call "%LOGGER_MODULE%" :Log "FORMAT" "SUCCESS" "%VIDEO_URL%"

) else (

    call "%LOGGER_MODULE%" :Log "FORMAT" "FAILED" "%VIDEO_URL%"

)

echo.
pause

goto FormatsMenu


:: ==========================================
:: Download by Format ID
:: ==========================================

:DownloadFormat

call :AskURL

echo.
set "FORMAT_ID="
set /p FORMAT_ID=Enter Format ID:

if not defined FORMAT_ID (
    echo.
    echo Format ID cannot be empty.
    timeout /t 2 >nul
    goto FormatsMenu
)

echo.
echo Downloading Format %FORMAT_ID%...
echo.

yt-dlp ^
-f "%FORMAT_ID%" ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: Handle Result
:: ==========================================

:HandleResult

if %ERRORLEVEL% EQU 0 (

    call "%LOGGER_MODULE%" :Log "FORMAT" "SUCCESS" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo      DOWNLOAD COMPLETED
    echo ==========================================
    echo.
    echo Saved to:
    echo %DOWNLOAD_FOLDER%

) else (

    call "%LOGGER_MODULE%" :Log "FORMAT" "FAILED" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo       DOWNLOAD FAILED
    echo ==========================================
    echo.
    echo Please verify:
    echo.
    echo - Format ID
    echo - Internet connection
    echo - URL
    echo - Cookies (if required)

)

echo.
pause

goto FormatsMenu
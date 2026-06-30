@echo off

:: ==========================================
:: Video Download Module
:: ==========================================

:DownloadMenu

cls
call "%BANNER_MODULE%"

echo ==========================================
echo           DOWNLOAD VIDEO
echo ==========================================
echo.
echo [1] Best Quality
echo [2] 720p MP4
echo [3] 1080p MP4
echo [4] 4K MP4
echo [5] Back
echo.
echo ==========================================

set "DOWNLOAD_OPTION="
set /p DOWNLOAD_OPTION=Select an option:

if "%DOWNLOAD_OPTION%"=="1" goto Best
if "%DOWNLOAD_OPTION%"=="2" goto Q720
if "%DOWNLOAD_OPTION%"=="3" goto Q1080
if "%DOWNLOAD_OPTION%"=="4" goto Q2160
if "%DOWNLOAD_OPTION%"=="5" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto DownloadMenu


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
    goto DownloadMenu
)

exit /b


:: ==========================================
:: Download Handler
:: ==========================================

:HandleResult

if %ERRORLEVEL% EQU 0 (

    call "%LOGGER_MODULE%" :Log "VIDEO" "SUCCESS" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo        DOWNLOAD COMPLETED
    echo ==========================================
    echo.
    echo Your video has been downloaded.
    echo.
    echo Location:
    echo %DOWNLOAD_FOLDER%

) else (

    call "%LOGGER_MODULE%" :Log "VIDEO" "FAILED" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo         DOWNLOAD FAILED
    echo ==========================================
    echo.
    echo Please verify:
    echo.
    echo - Internet connection
    echo - YouTube URL
    echo - Cookies (if required)
    echo.

)

echo.
pause
goto DownloadMenu


:: ==========================================
:: Best Quality
:: ==========================================

:Best

call :AskURL

echo.
echo Downloading Best Quality...
echo.

yt-dlp ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: 720p
:: ==========================================

:Q720

call :AskURL

echo.
echo Downloading 720p MP4...
echo.

yt-dlp ^
-f "bv*[height<=720][ext=mp4]+ba[ext=m4a]/b[height<=720][ext=mp4]" ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: 1080p
:: ==========================================

:Q1080

call :AskURL

echo.
echo Downloading 1080p MP4...
echo.

yt-dlp ^
-f "bv*[height<=1080][ext=mp4]+ba[ext=m4a]/b[height<=1080][ext=mp4]" ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: 4K
:: ==========================================

:Q2160

call :AskURL

echo.
echo Downloading 4K MP4...
echo.

yt-dlp ^
-f "bv*[height<=2160][ext=mp4]+ba[ext=m4a]/b[height<=2160][ext=mp4]" ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult
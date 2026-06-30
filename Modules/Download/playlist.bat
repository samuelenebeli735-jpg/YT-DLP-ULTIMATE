@echo off

:: ==========================================
:: Playlist Download Module
:: ==========================================

:PlaylistMenu

cls
call "%BANNER_MODULE%"

echo ==========================================
echo         PLAYLIST DOWNLOAD
echo ==========================================
echo.
echo [1] Download Playlist
echo [2] Download Channel
echo [3] Back
echo.
echo ==========================================

set "PLAYLIST_OPTION="
set /p PLAYLIST_OPTION=Select an option:

if "%PLAYLIST_OPTION%"=="1" goto Playlist
if "%PLAYLIST_OPTION%"=="2" goto Channel
if "%PLAYLIST_OPTION%"=="3" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto PlaylistMenu


:: ==========================================
:: Ask URL
:: ==========================================

:AskURL

cls
call "%BANNER_MODULE%"

echo ==========================================
echo      ENTER PLAYLIST / CHANNEL URL
echo ==========================================
echo.

set "VIDEO_URL="
set /p VIDEO_URL=URL:

if not defined VIDEO_URL (
    echo.
    echo URL cannot be empty.
    timeout /t 2 >nul
    goto PlaylistMenu
)

exit /b


:: ==========================================
:: Handle Result
:: ==========================================

:HandleResult

if %ERRORLEVEL% EQU 0 (

    call "%LOGGER_MODULE%" :Log "PLAYLIST" "SUCCESS" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo      DOWNLOAD COMPLETED
    echo ==========================================
    echo.
    echo Saved to:
    echo %DOWNLOAD_FOLDER%

) else (

    call "%LOGGER_MODULE%" :Log "PLAYLIST" "FAILED" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo       DOWNLOAD FAILED
    echo ==========================================
    echo.
    echo Please verify:
    echo.
    echo - Internet connection
    echo - URL
    echo - Cookies (if required)

)

echo.
pause
goto PlaylistMenu


:: ==========================================
:: Download Playlist
:: ==========================================

:Playlist

call :AskURL

echo.
echo Downloading Playlist...
echo.

yt-dlp ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: Download Channel
:: ==========================================

:Channel

call :AskURL

echo.
echo Downloading Channel...
echo.

yt-dlp ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult
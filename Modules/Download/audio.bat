@echo off

:: ==========================================
:: Audio Download Module
:: ==========================================

:AudioMenu

cls
call "%BANNER_MODULE%"

echo ==========================================
echo           DOWNLOAD AUDIO
echo ==========================================
echo.
echo [1] MP3
echo [2] WAV
echo [3] AAC
echo [4] FLAC
echo [5] Back
echo.
echo ==========================================

set "AUDIO_OPTION="
set /p AUDIO_OPTION=Select an option:

if "%AUDIO_OPTION%"=="1" goto MP3
if "%AUDIO_OPTION%"=="2" goto WAV
if "%AUDIO_OPTION%"=="3" goto AAC
if "%AUDIO_OPTION%"=="4" goto FLAC
if "%AUDIO_OPTION%"=="5" exit /b

echo.
echo Invalid option.
timeout /t 2 >nul
goto AudioMenu


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
    goto AudioMenu
)

exit /b


:: ==========================================
:: Handle Result
:: ==========================================

:HandleResult

if %ERRORLEVEL% EQU 0 (

    call "%LOGGER_MODULE%" :Log "AUDIO" "SUCCESS" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo      AUDIO DOWNLOAD COMPLETED
    echo ==========================================
    echo.
    echo Location:
    echo %DOWNLOAD_FOLDER%

) else (

    call "%LOGGER_MODULE%" :Log "AUDIO" "FAILED" "%VIDEO_URL%"

    echo.
    echo ==========================================
    echo       AUDIO DOWNLOAD FAILED
    echo ==========================================
    echo.
    echo Please verify:
    echo.
    echo - Internet connection
    echo - YouTube URL
    echo - Cookies (if required)

)

echo.
pause
goto AudioMenu


:: ==========================================
:: MP3
:: ==========================================

:MP3

call :AskURL

echo.
echo Downloading MP3...
echo.

yt-dlp ^
-x ^
--audio-format mp3 ^
--audio-quality 0 ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: WAV
:: ==========================================

:WAV

call :AskURL

echo.
echo Downloading WAV...
echo.

yt-dlp ^
-x ^
--audio-format wav ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: AAC
:: ==========================================

:AAC

call :AskURL

echo.
echo Downloading AAC...
echo.

yt-dlp ^
-x ^
--audio-format aac ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult


:: ==========================================
:: FLAC
:: ==========================================

:FLAC

call :AskURL

echo.
echo Downloading FLAC...
echo.

yt-dlp ^
-x ^
--audio-format flac ^
-P "%DOWNLOAD_FOLDER%" ^
"%VIDEO_URL%"

goto HandleResult
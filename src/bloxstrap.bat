@echo off
setlocal

REM Function to install Winget
:installWinget
echo Winget is not available. Downloading and installing...
powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/asheroto/winget-install/releases/download/4.0.3/winget-install.ps1 -OutFile winget-install.ps1"
powershell -ExecutionPolicy Bypass -File winget-install.ps1
if %errorlevel% neq 0 (
    echo Failed to install Winget. Exiting...
    exit /b 1
)
echo Winget has been installed successfully.

REM Restart the script to ensure environment variables are updated
echo Restarting the script...
goto :EOF

REM Check if Winget is installed
:checkWinget
winget --version >nul 2>&1
if %errorlevel% neq 0 (
    call :installWinget
)

REM Check if Bloxstrap is installed
:checkBloxstrap
winget show pizzaboxer.Bloxstrap >nul 2>&1
if %errorlevel% neq 0 (
    echo Bloxstrap is not installed.
    goto :EOF
)

REM Specify the path to Bloxstrap executable
set "bloxstrapPath=%LOCALAPPDATA%\Bloxstrap\Bloxstrap.exe"

REM Run Bloxstrap with the specified command
start "" "%bloxstrapPath%" -menu

:end

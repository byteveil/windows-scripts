@echo off

winget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget is not available. Downloading and installing...
    powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://github.com/asheroto/winget-install/releases/download/4.0.3/winget-install.ps1 -OutFile winget-install.ps1"
    powershell -ExecutionPolicy Bypass -File winget-install.ps1
    if %errorlevel% neq 0 (
        echo Failed to install Winget. Exiting...
        exit /b 1
    )
    echo Winget has been installed successfully.
)

winget show Discord >nul 2>&1
if %errorlevel% neq 0 (
    echo Discord is not installed. Installing...
    winget install Discord -e
    if %errorlevel% neq 0 (
        echo Failed to install Discord. Exiting...
        exit /b 1
    )
    echo Discord has been installed successfully.
)

echo Running Discord...
start "" "%LOCALAPPDATA%\Discord\Update.exe" --processStart Discord.exe

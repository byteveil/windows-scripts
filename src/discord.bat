@echo off

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
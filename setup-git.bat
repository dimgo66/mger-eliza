@echo off
cd /d "%~dp0"

echo Setting up Git for GitHub...

REM Find Git installation
if exist "C:\Program Files\Git\bin\git.exe" (
    set GIT_PATH=C:\Program Files\Git\bin\git.exe
) else if exist "C:\Program Files (x86)\Git\bin\git.exe" (
    set GIT_PATH=C:\Program Files (x86)\Git\bin\git.exe
) else (
    echo Git not found! Please install Git from https://git-scm.com/download/win
    pause
    exit /b 1
)

echo Using Git: %GIT_PATH%

REM Initialize repo if not already done
"%GIT_PATH%" init 2>nul || echo Repository already initialized

REM Configure user
"%GIT_PATH%" config user.name "User"
"%GIT_PATH%" config user.email "user@example.com"

REM Add files
"%GIT_PATH%" add .

REM Commit
"%GIT_PATH%" commit -m "Initial commit: Wedding invitation website"

echo.
echo =========================================
echo Git repository is ready!
echo =========================================
echo.
echo Next steps to push to GitHub:
echo.
echo 1. Create a new repository at https://github.com/new
echo 2. Copy the repository URL (e.g., https://github.com/username/repo.git)
echo 3. Run these commands:
echo.
echo    "%GIT_PATH%" remote add origin ^<YOUR_REPO_URL^>
echo    "%GIT_PATH%" branch -M main
echo    "%GIT_PATH%" push -u origin main
echo.
pause

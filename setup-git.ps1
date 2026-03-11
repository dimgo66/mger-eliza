# Refresh PATH from registry
$env:PATH = [System.Environment]::GetEnvironmentVariable('PATH','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('PATH','User')

# Change to script directory
Set-Location -Path "D:\myyan\Yandex.Disk\www-yandex\mger-elizaveta"

Write-Host "Setting up Git repository..." -ForegroundColor Green

# Initialize repository
git init

# Configure user
git config user.name "User"
git config user.email "user@example.com"

# Add all files
git add .

# Commit
git commit -m "Initial commit: Wedding invitation website"

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Git repository is ready!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps to push to GitHub:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Create a new repository at https://github.com/new"
Write-Host "2. Copy the repository URL (e.g., https://github.com/username/repo.git)"
Write-Host "3. Run these commands:"
Write-Host ""
Write-Host "   git remote add origin <YOUR_REPO_URL>"
Write-Host "   git branch -M main"
Write-Host "   git push -u origin main"
Write-Host ""

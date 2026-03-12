@echo off
cd /d "%~dp0"
refreshenv
git add index.html vercel.json
git commit -m "Add index.html and vercel.json for Vercel"
git push origin main --force
del "%~f0"

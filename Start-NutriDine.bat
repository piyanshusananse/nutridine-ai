@echo off
title NutriDine AI - Server & Launcher
echo ===================================================
echo           Starting NutriDine AI Platform...
echo ===================================================
echo.

cd /d "%~dp0"

echo [1/2] Opening browser at http://localhost:3000 ...
start http://localhost:3000

echo [2/2] Starting local Next.js server...
echo Server running at http://localhost:3000
echo (Keep this window open while using the website)
echo.

npm run dev
pause

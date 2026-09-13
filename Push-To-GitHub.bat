@echo off
title Push NutriDine AI to GitHub
echo ===================================================
echo        Pushing NutriDine AI to GitHub...
echo ===================================================
echo.

set "GIT_CMD=git"
if exist "C:\Program Files\Git\cmd\git.exe" set "GIT_CMD=C:\Program Files\Git\cmd\git.exe"

cd /d "%~dp0"

echo [1/6] Configuring Git Author Identity...
"%GIT_CMD%" config user.name "piyanshusanapse"
"%GIT_CMD%" config user.email "piyanshusanapse@users.noreply.github.com"

echo [2/6] Initializing Git repository...
"%GIT_CMD%" init

echo [3/6] Setting main branch...
"%GIT_CMD%" branch -M main

echo [4/6] Staging all files and folders...
"%GIT_CMD%" add .

echo [5/6] Committing codebase...
"%GIT_CMD%" commit -m "NutriDine AI Complete Source Code"

echo [6/6] Connecting to GitHub remote...
"%GIT_CMD%" remote remove origin 2>nul
"%GIT_CMD%" remote add origin https://github.com/piyanshusanapse/nutridine-ai.git

echo.
echo Pushing to GitHub (Sign in with browser popup if asked)...
"%GIT_CMD%" push -u origin --force main

echo.
echo ===================================================
echo   Done! All files and folders pushed to GitHub!
echo ===================================================
pause

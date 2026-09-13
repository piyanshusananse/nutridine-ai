@echo off
title Deploy NutriDine AI to Vercel
echo ===================================================
echo       Deploying NutriDine AI to Vercel
echo ===================================================
echo.
cd /d "%~dp0"

echo Running Vercel Production Deploy...
echo (If prompted, press Enter to accept defaults)
echo.

call npx vercel --prod

echo.
echo ===================================================
echo Done! Check your live Vercel deployment URL above.
echo ===================================================
pause

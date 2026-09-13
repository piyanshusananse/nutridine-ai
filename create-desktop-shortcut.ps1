$WshShell = New-Object -ComObject WScript.Shell
$DesktopPath = [System.Environment]::GetFolderPath('Desktop')
$ShortcutPath = Join-Path $DesktopPath "NutriDine AI.lnk"
$TargetBatch = "C:\Users\SHAILESH SANANSE\.gemini\antigravity\scratch\nutridine-ai\Start-NutriDine.bat"

$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetBatch
$Shortcut.WorkingDirectory = "C:\Users\SHAILESH SANANSE\.gemini\antigravity\scratch\nutridine-ai"
$Shortcut.Description = "Launch NutriDine AI Platform"
$Shortcut.IconLocation = "shell32.dll,13"
$Shortcut.Save()

Write-Host "Created shortcut successfully at: $ShortcutPath"

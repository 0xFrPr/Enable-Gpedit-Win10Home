@echo off

echo.
echo ===============================================
echo  [*] Enabling Local Group Policy Editor (gpedit)
echo  Author : 0xFrPr
echo ===============================================
echo.

if not exist "%SystemRoot%\servicing\Packages" (
  echo [!] Packages folder not found: %SystemRoot%\servicing\Packages
  pause
  exit /b 1
)

echo [+] Adding Client Tools packages...
for %%i in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~31bf3856ad364e35~*.mum") do (
  echo    -> %%~nxi
  dism /online /norestart /add-package:"%%i" >nul
)

echo [+] Adding Client Extensions packages...
for %%i in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~31bf3856ad364e35~*.mum") do (
  echo    -> %%~nxi
  dism /online /norestart /add-package:"%%i" >nul
)

echo.
echo [+] Running component health check (may take a while)...
dism /online /cleanup-image /restorehealth

echo.
echo [+] Verifying system files...
sfc /scannow

echo.
echo [*] Done. Please reboot, then press Win+R and run: gpedit.msc
pause

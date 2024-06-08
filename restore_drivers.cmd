@echo off
setlocal

set "backupDir=%SystemDrive%\Backup_Drv"

if not exist "%backupDir%" (
    echo The driver backup directory %backupDir% does not exist.
    pause >nul
    exit /b
)

for /r "%backupDir%" %%i in (*.inf) do (
    echo Installing driver from %%i...
    pnputil /add-driver "%%i" /install
)

echo All drivers have been restored.
pause >nul
endlocal
exit

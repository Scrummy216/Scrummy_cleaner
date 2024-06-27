@echo off
echo Batch File By Scrummy

REM Pytanie o potwierdzenie
set /p confirm=Press 1 and Enter to proceed with cleaning: 
if not "%confirm%"=="1" goto :end

REM Zatrzymywanie usług
net stop wuauserv
net stop UsoSvc
net stop bits
net stop dosvc

REM Oczyszczanie folderu %temp%
RD /S /Q %temp%
MKDIR %temp%

REM Oczyszczanie folderu C:\Windows\Temp
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp

REM Usuwanie plików log z całego systemu
cd/
del *.log /a /s /q /f

REM Usuwanie plików związanych z Windows Update
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

REM Oczyszczanie kosza
RD /S /Q C:\$Recycle.Bin
mkdir C:\$Recycle.Bin

REM Oczyszczanie folderu Prefetch
RD /S /Q C:\Windows\Prefetch
MKDIR C:\Windows\Prefetch

REM Oczyszczanie folderu Installer
RD /S /Q C:\Windows\Installer
MKDIR C:\Windows\Installer

REM Usuwanie punktów przywracania systemu
vssadmin delete shadows /for=c: /all /quiet

REM Oczyszczanie dodatkowych obszarów dysku
del /s /q C:\Windows\Temp\*.tmp
del /s /q C:\Windows\Temp\*.bak
del /s /q C:\Windows\Logs\*.log
rd /s /q C:\Windows\Logs
del /s /q C:\Windows\Prefetch\*.pf
del /s /q C:\Users\YourUsername\AppData\Local\Temp\*.tmp
del /s /q C:\Users\YourUsername\AppData\Local\Microsoft\Windows\INetCache\*.*

REM Otwieranie linku w przeglądarce
start https://github.com/Scrummy216/Scrummy_cleaner


del /s /q C:\ExampleDirectory\*.txt
rd /s /q C:\ExampleDirectory


:end
echo Cleaning Completed
pause

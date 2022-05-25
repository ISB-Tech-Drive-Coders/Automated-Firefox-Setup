@echo off
Mode 80,5 & color 0A
Title Downloading Firefox Setup from web using powershell and batch by Hackoo 2018
:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" >nul 2>&1
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo(
ECHO                      **************************************
ECHO                       Running Admin shell... Please wait...
ECHO                      **************************************

    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
   echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

   "%temp%\getadmin.vbs"
   del "%temp%\getadmin.vbs"
   exit /B

:gotAdmin
::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
Mode 110,3 & color 0A
Set "URL=http://download.cdn.mozilla.net/pub/firefox/releases/57.0.4/win32/en-US/Firefox Setup 57.0.4.exe"
Set "FileLocation=%userprofile%\Desktop\Firefox Setup 57.0.4.exe"
echo(
echo         Please wait a while ... Downloading file to "%FileLocation%"
Call :BalloonTip 'information' 10 '"Downloading Firefox Setup.exe"' "'Please wait... Downloading Firefox Setup.exe....'" 'info' 4
Call :Download "%url%" "%FileLocation%"
If "%errorlevel%" EQU "1" ( 
    Color 0C
    echo There is an error occured ! & Timeout /T 4 /Nobreak>nul & exit
) else (
    If exist "%FileLocation%" Start "" "%FileLocation%"
)
Exit
::*********************************************************************************
:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
exit /b
::*********************************************************************************
:BalloonTip $notifyicon $time $title $text $icon $Timeout
PowerShell  ^
  [reflection.assembly]::loadwithpartialname('System.Windows.Forms') ^| Out-Null; ^
[reflection.assembly]::loadwithpartialname('System.Drawing') ^| Out-Null; ^
$notify = new-object system.windows.forms.notifyicon; ^
  $notify.icon = [System.Drawing.SystemIcons]::%1; ^
  $notify.visible = $true; ^
  $notify.showballoontip(%2,%3,%4,%5); ^
  Start-Sleep -s %6; ^
  $notify.Dispose()
%End PowerShell%
exit /B
::********************************************************************************

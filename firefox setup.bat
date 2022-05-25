@echo off
set ver=7.0.1
echo This script will automatically download and install Mozilla Firefox.
echo.
echo An e-mail address is required for FTP access. You will not receive mail.
echo.
set email=
set /p email=Please enter your e-mail address to continue: 
echo.
echo The download is now in progress. This may take a while.
echo.
echo It is normal to see nothing happening for several moments.
cd c:\
echo user anonymous > c:\mozftp.txt
echo %email% >> c:\mozftp.txt
echo cd pub/mozilla.org/firefox/releases/%ver%/win32/en-US >> c:\mozftp.txt
echo get "Firefox Setup %ver%.exe" >> c:\mozftp.txt
echo bye >> c:\mozftp.txt
ftp -n -v -s:c:\mozftp.txt releases.mozilla.org > NUL
echo.
echo Download complete! Program installation will now begin.
echo.
pause
echo.
echo Installation in progress. Please wait...
echo.
"Firefox Setup %ver%.exe" -ms
echo Mozilla Firefox has been installed on your computer.
echo.
echo Cleaning up temporary files...
echo.
del "Firefox Setup %ver%.exe"
del mozftp.txt

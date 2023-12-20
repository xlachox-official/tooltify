@echo off
title Tooltify v1.0
:menu1
color 7
cls
echo.
echo Welcome to Tooltify v1.0 by xlachox!
echo.
echo Tooltify is a simple batch script made for you by xlachox that installs or removes Spicetify.
echo There are a few extra functions that the script can perform.
echo The script is open source, is not a virus, 100 percent harmless and only does what it should do.
echo.
echo.
echo 1) Install Spicetify
echo 2) Install Spicetify Marketplace
echo 3) Spicetify update
echo 4) Spicetify restore backup
echo 5) Spicetify backup apply
echo 6) Uninstall Spicetify
echo 7) Install Spotify
echo 8) Uninstall Spotify
echo 9) Advanced options
echo 0) Exit
set /p choice=Please choose an option from the menu above (number): 
if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto option4
if "%choice%"=="5" goto option5
if "%choice%"=="6" goto option6
if "%choice%"=="7" goto option7
if "%choice%"=="8" goto option8
if "%choice%"=="9" goto menu4
if "%choice%"=="0" exit
if "%choice%"=="showsecret" goto s1
echo Invalid selection. Please try again.
pause
goto menu1



:option1
cls
color 2
echo Installing Spicetify, please wait...
powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex"
echo Install Tooltify Updater on your computer, please wait...
timeout /t 3 /nobreak >nul
set source=".\bin\tooltify_updater.bat"
set destination="%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
copy %source% %destination%
echo Done!

pause
goto menu2



:option2
cls
color 2
echo Installing Spicetify Marketplace, please wait...
powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex"
pause
goto menu1


:option3
cls
color 2
echo Updating Spicetify, please wait...
powershell -Command "spicetify update"
pause
goto menu1



:option4
cls
color 2
echo Restoring Spicetify backup, please wait...
powershell -Command "spicetify restore backup"
pause
goto menu1



:option5
cls
color 2
echo Applying Spicetify backup, please wait...
powershell -Command "spicetify backup apply"
pause
goto menu1



:option6
cls
color 2
echo Uninstalling Spicetify from your computer, please wait...
powershell -Command "spicetify restore"
pause
goto menu3



:option7
cls
color 7
echo Select the right Spotify for your Windows:
echo.
echo 1) Windows 7
echo 2) Windows 8
echo 3) Windows 8.1
echo 4) Windows 10 and Windows 11 (latest)
echo.
echo 0) Main menu
echo.
set /p choice=Please choose an option from the menu above (number): 
if "%choice%"=="1" goto win7
if "%choice%"=="2" goto win8
if "%choice%"=="3" goto win81
if "%choice%"=="4" goto win1011
if "%choice%"=="0" goto menu1
echo Invalid selection. Please try again.
pause
goto option7

:win7
cls
color 2
echo Installing Spotify for Windows 7, please wait...
cd bin
cd spotify
start spotifywin7.exe
pause
goto menu1

:win8
cls
color 2
echo Installing Spotify for Windows 8, please wait...
cd bin
cd spotify
start spotifywin8.exe
pause
goto menu1

:win81
cls
color 2
echo Installing Spotify for Windows 8.1, please wait...
cd bin
cd spotify
start spotifywin81.exe
pause
goto menu1

:win1011
cls
color 2
echo Installing Spotify for Windows 10 and Windows 11 (latest), please wait...
cd bin
cd spotify
start spotifywin1011.exe
pause
goto menu1



:option8
cls
color 2
echo Uninstalling Spotify, please wait...
"%appdata%\\Spotify\\Spotify.exe" /uninstall
pause
goto menu1



:menu2
cls
color 7
echo Do you want to install Spicetify Marketplace?
echo.
echo 1) Yes
echo 2) No
echo.
set /p choice=Please choose an option from the menu above (number): 
if "%choice%"=="1" goto option2
if "%choice%"=="2" goto menu1
echo Invalid selection. Please try again.
pause
goto menu2



:menu3
cls
color 7
echo Do you want to remove the Spicetify AppData folders from your computer?
echo.
echo 1) Yes
echo 2) No
echo.
set /p choice=Please choose an option from the menu above (number): 
if "%choice%"=="1" goto appdatarm
if "%choice%"=="2" goto menu1
echo Invalid selection. Please try again.
pause
goto menu3

:appdatarm
cls
color 2
echo Removing Spicetify AppData folders from your computer, please wait...
timeout /T 3 /nobreak > nul
powershell -Command "rmdir -r -fo $env:APPDATA\spicetify"
powershell -Command "rmdir -r -fo $env:LOCALAPPDATA\spicetify"
pause
goto menu1



:menu4
cls
color 7
echo Advanced options menu
echo.
echo Tooltify will automatically update Spicetify every time Windows starts to always have the best experience with Spotify. 
echo This function is activated automatically as soon as you have already installed Spicetify with the Tooltify tool.
echo.
echo 1) Enable automatic update
echo 2) Disable automatic update
echo.
echo 0) Main menu
echo.
set /p choice=Please choose an option from the menu above (number): 
if "%choice%"=="1" goto updateon
if "%choice%"=="2" goto updateoff
if "%choice%"=="0" goto menu1
echo Invalid selection. Please try again.
pause
goto menu4

:updateon
cls
color 2
echo Installing Tooltify Updater on your computer, please wait...
timeout /t 3 /nobreak >nul
set source=".\bin\tooltify_updater.bat"
set destination="%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
copy %source% %destination%
echo Done!
pause
goto menu1

:updateoff
cls
color 2
echo Removing Tooltify Updater from your computer, please wait...
timeout /t 3 /nobreak >nul
del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\tooltify_updater.bat"
echo Done!
pause
goto menu1



:s1
cls
curl parrot.live
pause
goto menu1
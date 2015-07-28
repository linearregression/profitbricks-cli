reg query HKEY_LOCAL_MACHINE\SOFTWARE\Node.js

if errorlevel 1 GOTO :download
if errorlevel 0 GOTO :finish

:download
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
bitsadmin.exe /transfer "Downloading nodejs" http://nodejs.org/dist/v0.12.2/node-v0.12.2-x86.msi "%cd%\nodejs.msi"
GOTO :install

:64BIT
bitsadmin.exe /transfer "Downloading nodejs" http://nodejs.org/dist/v0.12.2/x64/node-v0.12.2-x64.msi "%cd%\nodejs.msi"
GOTO :install

:install
msiexec /i "nodejs.msi" /passive
del nodejs.msi
GOTO :finish

:finish
"c:\Program Files\nodejs\npm" install -g profitbricks-cli


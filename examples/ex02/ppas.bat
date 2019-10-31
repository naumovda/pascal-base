@echo off
SET THEFILE=test_xor
echo Assembling %THEFILE%
C:\lazarus\fpc\3.0.4\bin\i386-win32\as.exe --32 -o xor.o  xor.s
if errorlevel 1 goto asmend
SET THEFILE=xor.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.0.4\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections  -s  --entry=_mainCRTStartup    -o xor.exe link.res
if errorlevel 1 goto linkend
C:\lazarus\fpc\3.0.4\bin\i386-win32\postw32.exe --subsystem console --input xor.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end

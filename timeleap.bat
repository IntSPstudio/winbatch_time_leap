@echo off
REM Made by IntSPstudio
REM Time Leap
REM Thank you for using this software!
REM Version: 0.0.1.20172403
REM ID: 720002001
REM
REM Twitter: @IntSPstudio

REM SETTINGS
setlocal enabledelayedexpansion
set /a timeinterval=%1
set /a loopcounter=%2
set currenthour=%time: =0%
set /a currenthour=%currenthour:~0,2%
REM START INFO
echo Time interval: %timeinterval%
echo Loop counter: %loopcounter%
REM MAIN LOOP
for /l %%i in (1,1,%loopcounter%) do (
	REM 'FAKE' HOUR VALUE
	set /a fhh=%currenthour%+%%~ni
	REM GET TIME
	set ctime=!fhh!.!time:~3,2!.!time:~6,2!,!time:~9,2!
	REM CHANGE TIME
	time !ctime!
	REM PAUSE
	timeout /t %timeinterval%
)
REM BACK TO NORMAL
echo Changing time to normal
pause
set /a fhh=%currenthour%
set ltime=!fhh!.!time:~3,2!.!time:~6,2!,!time:~9,2!
time !ltime!
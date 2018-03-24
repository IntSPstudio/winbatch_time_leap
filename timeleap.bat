@echo off
REM Made by IntSPstudio
REM Time Leap
REM Thank you for using this software!
REM Version: 0.0.4.20172503
REM ID: 720002001
REM Twitter: @IntSPstudio

REM SETTINGS
echo Settings
setlocal enabledelayedexpansion
set /p timeinterval="-Time interval: "
set /p loopcounter="-Loop counter: "
set /p counterleap=" -Leap length: "
set currenthour=%time: =0%
set /a currenthour=%currenthour:~0,2%
set /a debugger=0
REM MAIN LOOP
echo.
set /a fhh=%currenthour%
for /l %%i in (1,1,%loopcounter%) do (
	REM 'FAKE' HOUR VALUE
	set /a check=!fhh!+%counterleap%
	set /a fhh+=%counterleap%
	if !check! geq 24 (
		set /a fhh-=24
	)
	REM GET TIME
	set ctime=!fhh!.!time:~3,2!.!time:~6,2!,!time:~9,2!
	REM CHANGE TIME
	if %debugger%==0 (
		time !ctime!
		echo %%i / %loopcounter%
	) else (
		echo %%i / %loopcounter% - !ctime!
	)
	REM PAUSE
	timeout /t %timeinterval% /nobreak > NUL
)
REM BACK TO NORMAL
echo.
echo Changing time to normal
if %debugger%==0 (
pause
)
set /a fhh=%currenthour%
set ltime=!fhh!.!time:~3,2!.!time:~6,2!,!time:~9,2!
if %debugger%==0 (
	time !ltime!
) else (
	echo !ltime!
)
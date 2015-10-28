@echo off
@SETLOCAL enabledelayedexpansion

echo %date% %time% ^*^*^* сборка файлов отчетов
for /D %%I in (out\*) do (
	echo %%~nI >>log.log 
	v8\v8unpack.exe -build "%%I" "ok\%%~nxI" >>log.log
	if NOT !ERRORLEVEL! EQU 0 echo ERROR: $$$$$$$$$$$ %%I >>log.log
	)

ENDLOCAL

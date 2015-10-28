@echo off
@SETLOCAL enabledelayedexpansion
md in out ok >nul 2>&1
cls&del log.*
::goto build
echo %date% %time% ^*^*^* распаковка файлов отчетов
for %%I in (in\*) do ( 
		echo %%~nI >>log.log 
		v8\v8unpack.exe -parse "%%I" "out\%%~nxI" >>log.log 
	)

echo %date% %time% ^*^*^* выявление отчетов с пустым модулем объекта
@for /D %%I in ("out\*") do (
	dir /b /s "%%I"|find "text">nul
	if NOT !ERRORLEVEL! EQU 0 (
		 @echo ^*^*^* file text absent ^>^>^> %%I >>log.absent
	)
)


if exist make_text.cmd call make_text.cmd
echo %date% %time% ^*^*^* добавление текста к модулю объекта...
for /R e:\ooo\out %%K in (*) do (
	if .%%~nK.==.text. ( type addition.txt >> %%K )
	)


:build
echo %date% %time% ^*^*^* сборка файлов отчетов
for /D %%I in (out\*) do (
	echo %%~nI >>log.log 
	v8\v8unpack.exe -build "%%I" "ok\%%~nxI" >>log.log
	if NOT !ERRORLEVEL! EQU 0 echo ERROR: $$$$$$$$$$$ %%I >>log.log
	)

ENDLOCAL

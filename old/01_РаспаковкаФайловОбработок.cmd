@echo off
md in out ok >nul 2>&1
cls&del log.*

echo %date% %time% ^*^*^* распаковка файлов отчетов
for %%I in (in\*) do ( 
		echo %%~nI >>log.log 
		v8\v8unpack.exe -parse "%%I" "out\%%~nxI" >>log.log 
	)

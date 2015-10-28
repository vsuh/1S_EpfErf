@echo off
@SETLOCAL enabledelayedexpansion

del log.absent 2>nul
echo %date% %time% ^*^*^* выявление отчетов с пустым модулем объекта
@for /D %%I in ("out\*") do (
	dir /b /s "%%I"|find "text">nul
	if NOT !ERRORLEVEL! EQU 0 (
		 @echo @md	"%%I\">>log.absent
		 @echo @touch	"%%I\\text">>log.absent
	)
)
ENDLOCAL
if exist log.absent type log.absent


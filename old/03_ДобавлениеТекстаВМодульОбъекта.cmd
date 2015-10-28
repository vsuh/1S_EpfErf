@echo off
@SETLOCAL enabledelayedexpansion
@Set tt=%temp%\ttEXT.txt.$$$.killme
rem.>%tt%

if exist make_text.cmd call make_text.cmd
echo %date% %time% ^*^*^* добавление текста к модулю объекта...
	for /R out %%K in (text) do (
		if exist %%~fK ( echo %%K>>%tt%
		                 )
	)

type %tt%|sed "s/E\:\\ooo\\out\\.*\#//;s/\\[-0-9a-z]*\.0\\text//">%tt%$$$
oscript E:\ooo\add2module.os %tt% %tt%$$$ E:\ooo\addition.txt 

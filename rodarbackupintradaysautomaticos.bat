@ECHO OFF
COLOR 30
Title Verificar na publica
::Mode 125

:: tratamento da data e hora da tarefas abertas
:: tratamento da data e hora
:iniciocodigo
set date=%date%
set datadia=%date:~0,2%
set datames=%date:~3,2%
set dataano=%date:~6,4%
set horaref=%time:~0,2%
set minutoref=%time:~3,2%
:: teste lógico da hora.

XCOPY /V "W:\PUBLICA\###Template Abertas###\Template Abertas %datadia%.%datames%\"*.* "X:\htdocs\arquivos\Template Abertas %datadia%.%datames%\" 

IF %horaref%==12  (
		if %minutoref%==18 (
		echo "Backup será realizado"
		XCOPY /V "W:\PUBLICA\###Template Abertas###\Template Abertas %datadia%.%datames%\"*.* "X:\htdocs\arquivos\Template Abertas %datadia%.%datames%\" 
		TIMEOUT /t 30
		) ELSE (
			TIMEOUT /t 30
		)
	) ELSE (
		echo "Ainda não é 20h"
		TIMEOUT /t 30
	)

goto iniciocodigo


PAUSE
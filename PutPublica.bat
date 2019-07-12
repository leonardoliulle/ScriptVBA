@ECHO OFF
COLOR C0
Title PutPUblica



:: tratamento da data e hora da tarefas abertas
:: tratamento da data e hora
:iniciocodigo
Del /q W:\PUBLICA\Bases_Click\
set date=%date%
set datadia=%date:~0,2%
set datames=%date:~3,2%
set dataano=%date:~6,4%
set horaref=%time:~0,2%
set minutoref=%time:~3,2%
echo minuto: %minutoref%
:: teste lógico da hora.

:: COPIAR BASE DE TECNICOS
set /a horateste=24
set /a horaref=24
:loopreduztecnico
	if %horateste% LEQ 9 (
	set horaref=0%horateste%) ELSE (
	set horaref=%horateste%)
	set nometecnico="R:\TecnicosdoClick_%datadia%-%datames%-%dataano% %horaref%"*.*
if EXIST "R:\TecnicosdoClick_%datadia%-%datames%-%dataano% %horaref%"*.* (COPY %nometecnico% W:\PUBLICA\Bases_Click\ /v) ELSE (
set /a horateste=%horateste%-1
set nometecnico="R:\TecnicosdoClick_%datadia%-%datames%-%dataano% %horaref%"*.*
COPY %nometecnico% W:\PUBLICA\Bases_Click\ /v
goto loopreduztecnico
)
ECHO COPIADO: %nometecnico%


:: COPIAR BASE DE FECHADAS
set /a horaref=24
set /a horateste=24
:loopreduzfec
	if %horateste% LEQ 9 (
	set horaref=0%horateste%) ELSE (
	set horaref=%horateste%)
	set nometecnico="R:\TarefasFechadasHoje_%datadia%-%datames%-%dataano% %horaref%"*.*
if EXIST "R:\TarefasFechadasHoje_%datadia%-%datames%-%dataano% %horaref%"*.* (COPY %nometecnico% W:\PUBLICA\Bases_Click\ /v) ELSE (
set /a horateste=%horateste%-1
set nometecnico="R:\TarefasFechadasHoje_%datadia%-%datames%-%dataano% %horaref%"*.*
COPY %nometecnico% W:\PUBLICA\Bases_Click\ /v
goto loopreduzfec
)
ECHO COPIADO: %nometecnico%


:: COPIAR BASE DE ABERTAS
set /a horaref=24
set /a horateste=24
:loopreduzabertas
	if %horateste% LEQ 9 (
	set horaref=0%horateste%) ELSE (
	set horaref=%horateste%)
	set nometecnico="R:\TarefasAbertas_%datadia%-%datames%-%dataano% %horaref%"*.*
if EXIST "R:\TarefasAbertas_%datadia%-%datames%-%dataano% %horaref%"*.* (COPY %nometecnico% W:\PUBLICA\Bases_Click\ /v) ELSE (
set /a horateste=%horateste%-1
set nometecnico="R:\TarefasAbertas_%datadia%-%datames%-%dataano% %horaref%"*.*
COPY %nometecnico% W:\PUBLICA\Bases_Click\ /v
goto loopreduzabertas
)
ECHO COPIADO: %nometecnico%


:: COPIAR BASE DE FECHADAS DE HOJE ONTEM
set /a horaref=23
set /a datadia=%datadia%-1
@ECHO ON
CD "D:\Users\leonardo.reis\Desktop\Scripts"
@ECHO OFF
DIR
msg * "Atualizar o intraday"
Verificador.Bat





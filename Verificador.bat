@ECHO OFF
COLOR 30
Title Verificar
Mode 125

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

if %horaref%==20 (TIMEOUT /t 32400)
if %horaref%==5 (goto iniciocodigo)

:: TESTE LOGICO PARA VERIFICAR A BASE
set /a horarefServidorAbertas=26
set /a horarefPublicaAbertas=26
set /a horateste=24

	:loopVoltaServidor
					
					if %horateste% LEQ 9 (
					set horarefServidorAbertas=0%horateste%
					) ELSE (
					set horarefServidorAbertas=%horateste%)

					if EXIST "R:\TarefasAbertas_%datadia%-%datames%-%dataano% %horarefServidorAbertas%"*.* (set /a horarefServidorAbertas=%horarefServidorAbertas%) else (
					set /a horateste=%horateste%-1
					echo horarefServidorAbertas: %horarefServidorAbertas%
					echo horateste: %horateste%
					goto loopVoltaServidor
					)


set /a horateste=24
	:loopVoltaEssedois
					if %horateste% LEQ 9 (
					set horarefPublicaAbertas=0%horateste%
					) ELSE (
					set horarefPublicaAbertas=%horateste%)

					if EXIST "W:\PUBLICA\Bases_Click\TarefasAbertas_%datadia%-%datames%-%dataano% %horarefPublicaAbertas%"*.* (set /a horarefPublicaAbertas=%horarefPublicaAbertas%) else (					set /a horarefPublicaAbertas=%horarefPublicaAbertas%-1
					set /a horateste=%horateste%-1
						if %horateste% LEQ 0 (goto sairloopVoltaEssedois)
					echo horarefPublicaAbertas: %horarefPublicaAbertas%
					echo horateste: %horateste%
					goto loopVoltaEssedois
					)

:: COMPARATIVO PARA REALIZAR O RESTANTE DOS COMANDOS.
:sairloopVoltaEssedois

if %horarefPublicaAbertas% == %horarefServidorAbertas% (goto endfinal) ELSE ( 
ECHO  =======================================
ECHO  =======================================
ECHO  =======================================
ECHO RODAR OUTROS SCRIPT
ECHO POR FAVOR, RODAR OUTRO SCRIPT
@ECHO ON
CD "D:\Users\leonardo.reis\Desktop\Scripts"
@ECHO OFF
DIR
set variavelparaoutrosarquivo=ABERTAS
PutPublica.Bat
ECHO  =======================================
ECHO  =======================================
ECHO  =======================================
)
:endfinal

COLOR 30
ECHO ========================================================
ECHO DEIXE O SCRIPT ROLANDO, A BASE ESTA ATUALIZADA
ECHO %datadia%-%datames%-%dataano% %horarefPublicaAbertas%
ECHO BASES DA PUBLICA:
FORFILES /P W:\PUBLICA\Bases_Click\
ECHO -----------
ECHO -----------
ECHO BASES DO SERVIDOR:
					if %horateste% LEQ 9 (
					set horarefServidorAbertas=0%horateste%
					) ELSE (
					set horarefServidorAbertas=%horateste%)
FORFILES /P R: /m *"%datadia%-%datames%-%dataano% %horarefServidorAbertas%"*
ECHO -----------
ECHO -----------
ECHO INTRADAYS ATUALIZADOS:
FORFILES /P "W:\PUBLICA\###Template Abertas####\Template Abertas %datadia%.%datames%"
ECHO +++++++++
ECHO ========================================================
TIMEOUT /t 60
goto iniciocodigo
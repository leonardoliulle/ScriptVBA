
:start
@ECHO OFF 
Color 70
echo """""""""
echo " 4 5 6 "
echo " 1 2 3 "
set /p chute=[digite de 1 a 6 para CHUTAR]
CLS
echo """""""""
echo " 4 5 6 "
echo " 1 2 3 "
set /p defesa=[digite de 1 a 6 para DEFENDER]
CLS
echo chute eh: %chute%
echo defesa eh: %defesa%
PAUSE
IF %chute% == %defesa%  (
ECHO DEFENDEU
) ELSE (
ECHO  GOLASSO.
set /a gols = gols + 1
echo Saldo de gols  + %gols%
)
PAUSE
goto start


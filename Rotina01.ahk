#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
::
Sleep, 1000
Run,"C:\Users\leonardo.reis\Desktop\Tela Unica\Automacoes.jar", C:\Users\leonardo.reis\Desktop\Tela Unica
Sleep, 7000
Send, {TAB}
Sleep, 500
Send, T
Sleep, 50
Send, R
Sleep, 50
Send, 6
Sleep, 50
Send, 5
Sleep, 50
Send, 2
Sleep, 50
Send, 7
Sleep, 50
Send, 6
Sleep, 50
Send, 5
Sleep, 50
Send, {TAB}
Sleep, 500
Send, {Enter}
Sleep, 60000
Send, {TAB}
Sleep, 500
Send, {TAB}
Sleep, 500
Send, tarefas fechadas
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
CurrentDateTime =
CurrentDateTime += -1, Days
FormatTime, CurrentDateTime, %CurrentDateTime%, dd/MM/yyyy
SendInput %CurrentDateTime%
Send {TAB}
Sleep 200
Send {TAB}
Sleep 200
Send, {Ctrl down}a{Ctrl up}
CurrentDateTime =
CurrentDateTime += -1, Days
FormatTime, CurrentDateTime, %CurrentDateTime%, dd/MM/yyyy
SendInput %CurrentDateTime%
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, R
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, R
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Enter}
Sleep, 15000
Send, ^{TAB}
Sleep, 500
Send, {Enter}
Sleep, 7000
Send, tarefasfechadasd-1
Sleep, 500
Send, {TAB}
Sleep, 500
Send, {TAB}
Sleep, 500
Send, {Enter}
Sleep, 8000
Send, {Enter}
Sleep, 1000
Send, ^{TAB}
Sleep, 1000
Send, ^{TAB}
Sleep, 500
Send, {Enter}
Sleep, 1000
Send, {TAB}
Sleep, 200
Send, {Ctrl down}a{Ctrl up}
Sleep, 200
FormatTime, TimeString,, dd/MM/yyyy tt
Send %TimeString%
Send {TAB}
Sleep 200
Send {TAB}
Sleep 200
Send, {Ctrl down}a{Ctrl up}
CurrentDateTime =
CurrentDateTime += 360, Days
FormatTime, CurrentDateTime, %CurrentDateTime%, dd/MM/yyyy
SendInput %CurrentDateTime%
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Enter}
Sleep, 15000
Send, ^{TAB}
Sleep, 1000
Send, {Enter}
Sleep, 7000
Send, tarefasabertas7h
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {TAB}
Sleep, 200
Send, {Enter}
Sleep, 10000
Send, {Enter}
Sleep, 700
Send, ^{TAB}
Sleep, 200
Send, ^{TAB}
Sleep, 200
Send, {Enter}
Sleep, 5000
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 500
Process, Close, javaw.exe
Sleep, 2000
ExitApp,
return
return
F4::pause

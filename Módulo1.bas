Attribute VB_Name = "M�dulo1"
Sub limpa_filtro()
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    
    
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_UF1").ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_SITUA��O_FOLHA"). _
        ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_STATUS_CLICK"). _
        ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_GESTOR_AREA").ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_GESTOR_OPERACIONAL"). _
        ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_GESTOR_GERAL"). _
        ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_HC_PCP?").ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_TIPO").ClearManualFilter
    ActiveWorkbook.SlicerCaches("Segmenta��odeDados_PRODUTO").ClearManualFilter
    Range("A1").Select

    Application.DisplayAlerts = True
    Application.ScreenUpdating = True


End Sub


Sub usuario()
   'Computador = Environ("Computername")
   'dominio = Environ("USERDOMAIN")
   user = Environ("USERNAME")
   
   If user <> "farias.cesar" Then
   MsgBox "O usu�rio: " & user & " n�o tem autoriza��o para atualiza��o. Favor entrar em contato com a SEF RNE atrav�s do e-mail sef.rpe@redeconecta.net.br", vbCritical, "SEF RNE - Planejamento"
   Else
   ActiveWorkbook.RefreshAll
   End If
   
   
 
   'MsgBox "Computador: " & Computador
   'MsgBox "Dominio: " & dominio
   'MsgBox "Usuario: " & user
End Sub


Sub enviar_email()
           
Application.ScreenUpdating = False
Application.DisplayAlerts = False
    
 
    Sheets("configuracoes").Select
    EmailTo = Cells(2, 7).Value
    EmailCC = Cells(3, 7).Value
'   EmailCCO = Cells(0, 0).Value
    Assunto = Cells(4, 7).Value
    Descricao = Cells(5, 7).Value
'   Arquivo = Cells(0, 0).Value
'   Mes = Cells(0, 0).Value
'   Pasta = Cells(0, 0).Value
                
    Dim appOutlook As Object
    Dim olMail As Object
            
    'Verifica se Outlook est� aberto. Caso n�o esteja, cria nova inst�ncia
    On Error Resume Next
    Set appOutlook = GetObject(, "Outlook.Application")
    If appOutlook Is Nothing Then
        Set appOutlook = CreateObject("Outlook.Application")
    End If
    On Error GoTo 0
    
    Set olMail = appOutlook.CreateItem(0) '0 � um item de e-mail

    With olMail
        .To = EmailTo
        .CC = EmailCC
        .BCC = EmailCCO
        .Subject = Assunto
         
        .Attachments.Add ActiveWorkbook.FullName
      ' ActiveWindow.Close
   
      
        .Body = Descricao
        .Display
        appOutlook

    End With

Application.ScreenUpdating = True
Application.DisplayAlerts = True


End Sub
Sub Duvidas()
form_aviso.Show
End Sub



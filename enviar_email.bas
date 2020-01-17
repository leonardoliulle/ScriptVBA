Attribute VB_Name = "enviar_email"
Private Sub Gera_Imagem()
       
   
    Dim tmpSheet As Worksheet
    Dim tmpChart As Chart
    Dim tmpImg As Object
    Dim fjpeg As String
    Dim margem As Integer
    
    On Error GoTo erro
  
    'Caso seja uma area fixa a copiar
    
    Sheets("configuracoes").Select
    ActiveSheet.PivotTables("resumo_email").PivotCache.Refresh
    Columns("A:A").Select
    Selection.ColumnWidth = 16.86
    Columns("B:F").Select
    Selection.ColumnWidth = 12
    Range("A14:F25").CopyPicture _
                       Appearance:=xlScreen, _
                       Format:=xlBitmap
    
    'Usar a selecção activa
    'Selection.CopyPicture Appearance:=xlScreen, Format:=xlBitmap
    
    'impede que se veja a acção acelerando o procedimento de cópia e exportação

    
        'uma folha para colocarmos o grafico sem atrapalhar o resto
        Set tmpSheet = Worksheets.Add
        
        'colocar um grafico nesta nova folha
        Charts.Add
        
        'definições essenciais ao grafico, para que fique numa worksheet
        'e não numa folha grafico
        
        ActiveChart.Location Where:=xlLocationAsObject, Name:=tmpSheet.Name
        'Colar a  zona copiada para dentro da area do grafico
        
        Set tmpChart = ActiveChart
        
            With tmpChart
                 
                 .Paste
                 
                 Set tmpImg = Selection
                 
                 With .ChartArea
                      '--------->
                      '(não essencial ao funcionamento da rotina)
                      'coloca um degrade no fundo do grafico
                      ' .Fill.OneColorGradient _
                      '    Style:=msoGradientHorizontal, _
                      '    Variant:=1, _
                      '    Degree:=0.231372549019608
                      '<----------
                      'sem linha de rebordo
                       .Border.LineStyle = xlNone
                 End With
                 
                 'configurar a area do grafico acrescentando
                 'uma pequena borda ao redor da imagem centrando esta
                 
                 margem = 1
                 
                 With .Parent
                 ' .Height = tmpImg.Height
                 ' .Width = tmpImg.Width + margem
                 End With
                 
            End With
            
    'localização e nome do ficheiro de imagem
    'fjpeg = ThisWorkbook.Path & _
          "\Teste.jpeg"
          
    'localização e nome do ficheiro de imagem
    fjpeg = Environ("temp") & "\Teste.jpeg"
          
    'exportar grafico
    tmpChart.Export Filename:=fjpeg, FilterName:="jpeg"
    
    'eliminar a folha temporaria sem avisos
        Application.DisplayAlerts = False
    
            tmpSheet.Delete
    
        Application.DisplayAlerts = True
        
        
        
    'repor o estado normal
    Range("A1").Select
    Application.ScreenUpdating = True
    
   'aviso de operação terminada
   ' MsgBox "Seu Arquivo encontra-se em " & fjpeg, _
   '        vbInformation, _
   '        ".:: Exportação"
   

   
    GoTo fim
    
erro:
    MsgBox "Erro: " & Err.Description, _
            vbCritical, _
           "Erro: " & Err.Number
fim:

    Set tmpSheet = Nothing
    Set tmpChart = Nothing
    Set tmpImg = Nothing
    
End Sub

Private Sub Email_Imagem()



  'Trabalhar no Office 2000-2010
    Dim OutApp As Object
    Dim OutMail As Object
    Dim strbody As String
    Dim SigString As String
    Dim Signature As String

    NomePlanilha = ActiveWorkbook.Name
    NomeCaminho = VBA.Environ("USERPROFILE") & "\Desktop\"
    Worksheets("configuracoes").Range("d2").Value = "Quadro Click - " & Format(Worksheets("configuracoes").Range("c2"), "dd_mm_yyyy")
    NomeArquivo = Worksheets("configuracoes").Range("d2").Value
    




    Set OutApp = CreateObject("Outlook.Application")
    Set OutMail = OutApp.CreateItem(0)
    
    Dim Manha As String
    Dim Tarde As String
    Dim Noite As String
    Dim Texto As String
    Dim Assunto As String
    
    
    
    EmailTo = Cells(2, 7).Value
    EmailCC = Cells(3, 7).Value
'   EmailCCO = Cells(0, 0).Value
    Descricao = Cells(5, 7).Value
    Assunto = Cells(2, 4).Value
'   Arquivo = Cells(0, 0).Value
'   Mes = Cells(0, 0).Value
'   Pasta = Cells(0, 0).Value
    
    
   
    Relatorio = "Quadro Click"

    Manha = "Prezados, bom dia!"
    Tarde = "Prezados, boa tarde!"
    Noite = "Prezados, boa noite!"

    If TimeValue(Now) < TimeValue("12:00:00") Then
      Texto = Manha
     ElseIf TimeValue(Now) > TimeValue("12:00:00") And TimeValue(Now) < TimeValue("18:00:00") Then
      Texto = Tarde
     ElseIf TimeValue(Now) > TimeValue("18:00:00") Then
      Texto = Noite
    End If

    strbody = " <u> <b> <font face='verdana'> <font size='2'>" & Texto & " </b> </u>" & _
                     "<font size='2'> <br> <br> <br>" & Descricao & "<br>"
                     
    
    
   ' "<h4>  & Texto </font></p></h4>"
    
    
             

    On Error Resume Next
    With OutMail
       'Envindo para os enderecos abaixos
        .To = EmailTo
              
       'Enviando com Copia para o enderecos abaixos
        .CC = EmailCC
        
       'Enviando com Copia Oculta para o enderecos abaixos
        .BCC = ""
        
       'Titulo do Email
        .Subject = Assunto
        
       'Corpo do Email
        .HTMLBody = strbody & "<BR><BR>" & _
        "<img src='" & Environ("temp") & "\Teste.jpeg'>" & _
        Signature

        'Anexar aquivos
        .Attachments.Add ActiveWorkbook.FullName
        
        'NomeCaminho & NomeArquivo & ".xlsb"
        
        .Display 'Exibição do Display
        '.Send   'Envio sem Display
        
    End With

    On Error GoTo 0
    Set OutMail = Nothing
    Set OutApp = Nothing
    
End Sub

Sub Email_Com_Imagem()

    Call Gera_Imagem
    Call Email_Imagem
    
    Kill (Environ("temp") & "\Teste.jpeg")
    Sheets("Index").Select

End Sub





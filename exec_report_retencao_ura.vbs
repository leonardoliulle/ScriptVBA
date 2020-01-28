Set xlApp = CreateObject("Excel.Application")
xlApp.Visible = True
xlApp.DisplayAlerts = True
Set xlWB = xlApp.Workbooks.Open("C:\automacoes\report_retencao_ura_v1.xlsm", False)
xlApp.Run "inicializador"

xlApp.application.quit
wscript.quit

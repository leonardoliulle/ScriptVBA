Function ExcelCSV($path){
	$pwd = $path 

	Write-Host $pwd 
	
	$excelFile =$pwd + ".xlsx" 
	Write-Host $excelFile 

	$excelFile = Resolve-Path $excelFile
	Write-Host $excelFile 

	If (Test-Path $excelFile){
		Write-Host "EXISTE" 
	}Else{
		Write-Host "NÃO EXISTE" 
	}
 

	#$Excel = New-Object -ComObject Excel.Application
	$Excel = New-Object -COM "Excel.Application"
	if (!($excel)) {throw "Can not create Excel COM object" }

	$Excel.Visible = $false
	$Excel.DisplayAlerts = $false
	$wb = $Excel.Workbooks.Open($excelFile)

	foreach ($ws in $wb.Worksheets){
		$ws.SaveAs($pwd + ".csv", 6)
	}

	$Excel.Quit()
}

Write-Host $args[0]

ExcelCSV($args[0])
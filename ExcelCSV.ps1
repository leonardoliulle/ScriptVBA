Function ExcelCSV([string]$path, [string]$file_name){
	$pwd = "C:\T\"
	$File = "TecnicosdoClick_"
	
	#$pwd = $path
	#$File = $file_name
	
	
	$excelFile = $pwd+$File+".xlsx" 
	$Excel = New-Object -ComObject Excel.Application
	#$Excel = New-Object -com Excel.Application
	$Excel.Visible = $false
	$Excel.DisplayAlerts = $false
	$wb = $Excel.Workbooks.Open($excelFile)

	foreach ($ws in $wb.Worksheets){
		$ws.SaveAs($pwd+$File+".csv", 6)
	}

	$Excel.Quit()
}

Write-Host $args[0]

Write-Host $args[1]

ExcelCSV($args[0],$args[1])



Function ExcelCSV2([string]$path, [string]$file_name){
	$pwd = "C:\T\"
	$File = "TarefasFechadasHoje_"
	
	#$pwd = $path
	#$File = $file_name
	
	
	$excelFile = $pwd+$File+".xlsx" 
	$Excel = New-Object -ComObject Excel.Application
	#$Excel = New-Object -com Excel.Application
	$Excel.Visible = $false
	$Excel.DisplayAlerts = $false
	$wb = $Excel.Workbooks.Open($excelFile)

	foreach ($ws in $wb.Worksheets){
		$ws.SaveAs($pwd+$File+".csv", 6)
	}

	$Excel.Quit()
}

Write-Host $args[0]

Write-Host $args[1]

ExcelCSV2($args[0],$args[1])
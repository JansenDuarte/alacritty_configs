# Start programs needed for work

Function SlowWrite {
	Param([string[]]$text,
	$endLine)
	$charArray = $text.ToCharArray()

	for ($i = 0; $i -le $charArray.Count; $i++){
		Write-Host $charArray[$i] -NoNewLine
		Start-Sleep -Milliseconds 25
	}

	if ($endLine -eq $null){
		Write-Host ""
	}
	else{
		Write-Host $endLine -NoNewLine
	}
}

Function StartProgram {
	Param([string[]]$pathToExe,
	$wait)
	$exeName = $pathToExe.Split('\')
	$exeName = $exeName[$exeName.Count - 1]
	$msg = "Starting " + $exeName + "..."
	SlowWrite $msg
	
	if ($wait -eq $null){
		& $pathToExe *> $null
	}else{
		Start-Process $pathToExe -Wait
	}

	SlowWrite "Completed"
}

#=== Actual Prog Loop ===#
Clear-Host
SlowWrite "Starting work enviroment..."
Start-Sleep -Milliseconds 500

StartProgram "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" 
StartProgram "D:\Microsoft VS Code\Code.exe"
StartProgram "C:\xampp\xampp-control.exe"
StartProgram "C:\Users\vikin\AppData\Local\Programs\WinSCP\WinSCP.exe"

SlowWrite "Work enviroment setup successfully!"
$timeToReturn = 10
$timeToShow = $timeToReturn
for ($i = 0; $i -le $timeToReturn; $i++)
{
	$timeToShow = $timeToReturn - $i
	SlowWrite "Clearing terminal in $timeToShow s..." -endLine "`r"
	Start-Sleep -Seconds 1

}
& "C:\Users\vikin\AppData\Roaming\alacritty\init.ps1"

Return
#=== Actual Prog Loop ===#

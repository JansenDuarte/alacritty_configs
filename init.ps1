
#for($i = 0; $i -le 10; $i++)
#{
#	if ($i % 2 -eq 0)
#	{
#		Write-Host "0"
#	}
#	else
#	{
#		Write-Host "1"
#	}
#}


$terminalName = ' Alacritty Terminal '




$size = $terminalName.Length + 2
$tab = ("-" * $size)
$space = (" " * $size)




Clear-Host

Write-Host "|$tab|" -ForegroundColor Yellow
Write-Host "|$space|" -ForegroundColor Yellow

Write-Host "|>" -NoNewline  -ForegroundColor Yellow
Write-Host $terminalName -NoNewline -ForegroundColor Cyan
Write-Host "<|" -ForegroundColor Yellow

Write-Host "|$space|" -ForegroundColor Yellow
Write-Host "|$tab|" -ForegroundColor Yellow

#just a new line
Write-Host ""


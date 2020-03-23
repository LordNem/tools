cls

Write-Host @"
Kracken                                         
"@ -fo green

$cwd = (Resolve-Path .\).Path
Write-Host $cwd -fo red

#Setting up the Config File for first time run:
Write-Host "Setting up Config file" -fo yellow
If(Test-Path .\config.txt) {
$HCPath = get-content ".\config.txt" | select-string -pattern hashcat
$words = get-content ".\config.txt" | select-string -pattern wordlists
$rules = get-content ".\config.txt" | select-string -pattern rules 
} Else {
$HCPath = Read-Host "Where is Hashcat64.exe"
$words = Read-Host "Where are your wordlists?"
$rules = Read-Host "Where are your hashcat rules?"
}

#Checking if config exists do not overwrite:
If(Test-Path .\config.txt) { } Else {
"$HCPath" | Out-File -FilePath "$cwd\config.txt" -Encoding utf8
"$words" | Out-File -FilePath "$cwd\config.txt" -Append -Encoding utf8
"$rules" | Out-File -FilePath "$cwd\config.txt" -Append -Encoding utf8
}

#Grabbig Hashes:
Write-Host "Config Set" -fo yellow
cls
$Hashpath = Read-Host "Enter path to the Hashes you want to Crack"

Write-host "#########################"
Write-host "# Cracking Using Hashcat#" -fo Yellow
Write-host "#########################"-fo green

cmd /c $HCPath -m 1000 $Hashpath $words"*.txt" -w3 --rules $rules"\First.rule"
cmd /c $HCPath -m 1000 $Hashpath --show > $cwd\OutPutHashes1.txt"
cmd /c $HCPath -m 1000 $Hashpath $words"*.txt" -w3 --rules $rules"\Second.rule"
cmd /c $HCPath -m 1000 $Hashpath --show > $cwd"\OutPutHashes2.txt"
cmd /c $HCPath -m 1000 $Hashpath $words"*.txt" -w3 --rules "$rules\Big.rule"
cmd /c $HCPath -m 1000 $Hashpath --show > $cwd"\OutPutHashes3.txt"
pause 

$file = "d:\Antigravity\E-Portofolio PPG\index.html"
$lines = Get-Content $file
# Remove lines 7108 to 7250 (which are indexes 7107 to 7249)
$newLines = $lines[0..7106] + $lines[7250..($lines.Length - 1)]
[System.IO.File]::WriteAllLines($file, $newLines)
Write-Host "Removed garbage lines."

$indexPath = "d:\Antigravity\E-Portofolio PPG\index.html"
$injectPath = "d:\Antigravity\E-Portofolio PPG\sem2_inject.html"

$indexContent = Get-Content -Path $indexPath -Raw
$injectContent = Get-Content -Path $injectPath -Raw

# Replace the first occurrence of <footer with the injected content followed by <footer
$indexContent = $indexContent -replace "(?i)<footer>", "$injectContent`r`n    <footer>"

[System.IO.File]::WriteAllText($indexPath, $indexContent, [System.Text.Encoding]::UTF8)
Write-Host "Injected sem2_inject.html into index.html successfully."

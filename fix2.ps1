$path = "d:\Antigravity\E-Portofolio PPG\index.html"
$content = Get-Content -Raw -Path $path
$target = "        .splash-btn:hover {`r`n                    hideSplash();`r`n                }`r`n            });"
$target2 = "        .splash-btn:hover {`n                    hideSplash();`n                }`n            });"
$replacement = Get-Content -Raw -Path "d:\Antigravity\E-Portofolio PPG\replacement.txt"

if ($content -match [regex]::Escape($target)) {
    $newContent = $content.Replace($target, $replacement + "`r`n                    hideSplash();`r`n                }`r`n            });")
    Set-Content -Path $path -Value $newContent -NoNewline
    Write-Host "Fixed with CRLF"
} elseif ($content -match [regex]::Escape($target2)) {
    $newContent = $content.Replace($target2, $replacement + "`n                    hideSplash();`n                }`n            });")
    Set-Content -Path $path -Value $newContent -NoNewline
    Write-Host "Fixed with LF"
} else {
    Write-Host "Target not found."
}

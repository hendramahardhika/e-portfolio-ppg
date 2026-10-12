$path = "d:\Antigravity\E-Portofolio PPG\index.html"
$content = Get-Content -Raw -Path $path

$target = "            // Explicitly the button`r`n            if (enterBtn) enterBtn.addEventListener('click', (e) => {`r`n                e.stopPropagation();`r`n            // Swipe Up (Touch)"
$target2 = "            // Explicitly the button`n            if (enterBtn) enterBtn.addEventListener('click', (e) => {`n                e.stopPropagation();`n            // Swipe Up (Touch)"

$replacement = "            // Explicitly the button`r`n            if (enterBtn) enterBtn.addEventListener('click', (e) => {`r`n                e.stopPropagation();`r`n                hideSplash();`r`n            });`r`n`r`n            // Swipe Up (Mouse Wheel)`r`n            splash.addEventListener('wheel', (e) => {`r`n                if (e.deltaY > 0) {`r`n                    hideSplash();`r`n                }`r`n            });`r`n`r`n            // Swipe Up (Touch)"
$replacement2 = "            // Explicitly the button`n            if (enterBtn) enterBtn.addEventListener('click', (e) => {`n                e.stopPropagation();`n                hideSplash();`n            });`n`n            // Swipe Up (Mouse Wheel)`n            splash.addEventListener('wheel', (e) => {`n                if (e.deltaY > 0) {`n                    hideSplash();`n                }`n            });`n`n            // Swipe Up (Touch)"


if ($content -match [regex]::Escape($target)) {
    $newContent = $content.Replace($target, $replacement)
    Set-Content -Path $path -Value $newContent -NoNewline
    Write-Host "Fixed with CRLF"
} elseif ($content -match [regex]::Escape($target2)) {
    $newContent = $content.Replace($target2, $replacement2)
    Set-Content -Path $path -Value $newContent -NoNewline
    Write-Host "Fixed with LF"
} else {
    Write-Host "Target not found."
}

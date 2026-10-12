$files = @("d:\Antigravity\E-Portofolio PPG\index.html", "d:\Antigravity\E-Portofolio PPG\sem2_inject.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file)
    
    # 1. Add min-height to title to ensure alignment across cards (2 lines height)
    # The current title style is: font-family: var(--font-body); font-weight: 700; color: #1e3a8a; font-size: 1.1rem; margin-bottom: 0.75rem;
    $content = $content -replace '(<h3 class="refleksi-title" style=".*?margin-bottom: 0\.75rem;)"', '$1 min-height: 3rem;"'
    
    # 2. Add text-align: justify; to description
    # The current desc style is: color: var(--text-muted); font-size: 0.85rem; line-height: 1.6; margin-bottom: 1.25rem; flex-grow: 1;
    $content = $content -replace '(<p class="refleksi-desc" style=".*?flex-grow: 1;)"', '$1 text-align: justify;"'
    
    [System.IO.File]::WriteAllText($file, $content)
}

Write-Host "Done"

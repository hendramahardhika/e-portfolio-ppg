$files = @("d:\Antigravity\E-Portofolio PPG\index.html", "d:\Antigravity\E-Portofolio PPG\sem2_inject.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file)
    
    # 1. Add padding: 1.2rem; to the refleksi-card style to make the background border thinner
    $content = $content -replace 'style="border-top: 5px solid (#.*?);"', 'style="border-top: 5px solid $1; padding: 1rem;"'
    
    # 2. Reduce title font size from 1.25rem to 1.1rem
    $content = $content -replace 'font-size: 1\.25rem;', 'font-size: 1.1rem;'
    
    # 3. Increase image aspect ratio height from 56.25% to 62.5%
    $content = $content -replace 'padding-top: 56\.25%;', 'padding-top: 62.5%;'
    
    # 4. Make description font size slightly smaller 0.85rem instead of 0.9rem so it doesn't take up too much vertical space
    # The regex is 'font-size: 0\.9rem;' and only in the context of refleksi-desc
    $content = $content -replace '<p class="refleksi-desc" style="(.*?); font-size: 0\.9rem;', '<p class="refleksi-desc" style="$1; font-size: 0.85rem;'
    
    [System.IO.File]::WriteAllText($file, $content)
}

Write-Host "Done"

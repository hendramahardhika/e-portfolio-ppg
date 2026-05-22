$lines = Get-Content "d:\Antigravity\index.html"
$output = @()
$skip = $false
$inItem1 = $false

foreach ($line in $lines) {
    if ($line -match '"1": \{') {
        $inItem1 = $true
    }
    if ($line -match '"2": \{') {
        $inItem1 = $false
    }
    
    if (!$inItem1 -and ($line -match 'customHtml:\s*`')) {
        $skip = $true
        # Remove trailing comma from the previous line
        if ($output.Count -gt 0) {
            $output[$output.Count - 1] = $output[$output.Count - 1] -replace ',$', ''
        }
        continue
    }
    
    if ($skip) {
        if ($line -match '^\s*`\s*,?\s*$') {
            $skip = $false
        }
        continue
    }
    
    $output += $line
}

$output | Set-Content "d:\Antigravity\index.html" -Encoding UTF8
Write-Host "Successfully cleaned up customHtml configurations."

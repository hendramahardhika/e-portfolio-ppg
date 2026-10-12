$lines = Get-Content -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Encoding UTF8

# Extract new semester1-screen
$sem1StartIdx = 2112  # line 2113 is index 2112
# Find end of semester1-screen
$sem1EndIdx = $sem1StartIdx
while ($lines[$sem1EndIdx] -notmatch '<!-- SEMESTER 1 SCREEN \(SIMPLE OLD STYLE\)' -and $lines[$sem1EndIdx] -notmatch '<!-- SELECTION SCREEN') {
    if ($lines[$sem1EndIdx] -match '<script>') {
        break
    }
    $sem1EndIdx++
}

$sem1Lines = $lines[$sem1StartIdx..($sem1EndIdx-1)]
$sem1Text = $sem1Lines -join "`n"

$selText = $sem1Text.Replace('id="semester1-screen"', 'id="selection-screen"')
$selText = $selText.Replace('id="btn-sem1-port1"', 'id="btn-portfolio1"')
$selText = $selText.Replace('id="btn-sem1-port2"', 'id="btn-portfolio2"')
$selText = $selText.Replace('id="btn-back-semester1"', 'id="btn-back-selection"')
$selText = $selText.Replace('SEMESTER 1 SCREEN (UPDATED)', 'SELECTION SCREEN (UPDATED)')

$selStartIdx = -1
$selEndIdx = -1

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '<div id="selection-screen" class="hidden">') {
        $selStartIdx = $i
    }
    if ($selStartIdx -ne -1 -and $i -gt $selStartIdx -and $lines[$i] -match '<!-- Navigation -->') {
        $selEndIdx = $i
        break
    }
}

if ($selStartIdx -ne -1 -and $selEndIdx -ne -1) {
    # Replace lines from selStartIdx to selEndIdx-1 with selText
    $newLines = new-object System.Collections.ArrayList
    $newLines.AddRange($lines[0..($selStartIdx-1)])
    $newLines.Add($selText)
    $newLines.AddRange($lines[$selEndIdx..($lines.Count-1)])
    
    Set-Content -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Value ($newLines -join "`n") -Encoding UTF8
    Write-Output "Selection screen updated."
} else {
    Write-Output "Could not find selection-screen bounds."
}

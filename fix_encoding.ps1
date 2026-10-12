$path = "d:\Antigravity\E-Portofolio PPG\index.html"
$content = Get-Content -Path $path -Encoding UTF8 -Raw

function Fix-Mojibake {
    param(
        [string]$HexStr,
        [string]$Replacement
    )
    $bytes = [byte[]]($HexStr -split '-' | ForEach-Object { [Convert]::ToByte($_, 16) })
    $str = [System.Text.Encoding]::UTF8.GetString($bytes)
    return $content.Replace($str, $Replacement)
}

# Checkmark: â œ “ (E2 9C 93) -> C3 A2 C5 93 E2 80 9C
$content = Fix-Mojibake -HexStr "C3-A2-C5-93-E2-80-9C" -Replacement '<i class="ph-bold ph-check"></i>'

# Warning: â š NBSP (E2 9A A0) -> C3 A2 C5 A1 C2 A0
$content = Fix-Mojibake -HexStr "C3-A2-C5-A1-C2-A0" -Replacement '<i class="ph-bold ph-warning"></i>'

# Arrow Right-Up: â † — (E2 86 97) -> C3 A2 E2 80 A0 E2 80 94
$content = Fix-Mojibake -HexStr "C3-A2-E2-80-A0-E2-80-94" -Replacement '<i class="ph-bold ph-arrow-up-right"></i>'

# Apostrophe: â € ™ (E2 80 99) -> C3 A2 E2 82 AC E2 84 A2
$content = Fix-Mojibake -HexStr "C3-A2-E2-82-AC-E2-84-A2" -Replacement "'"

# Left Quote: â € œ (E2 80 9C) -> C3 A2 E2 82 AC C5 93
$content = Fix-Mojibake -HexStr "C3-A2-E2-82-AC-C5-93" -Replacement '"'

# Right Quote: â € (E2 80 9D) -> C3 A2 E2 82 AC ...? (0x9D is undefined in CP1252, sometimes it becomes nothing)
# Let's check for â €  (C3 A2 E2 82 AC) alone? No, that might break things.

# Em-Dash: â € ” (E2 80 94) -> C3 A2 E2 82 AC E2 80 9D
$content = Fix-Mojibake -HexStr "C3-A2-E2-82-AC-E2-80-9D" -Replacement "—"

# En-Dash: â € “ (E2 80 93) -> C3 A2 E2 82 AC E2 80 9C
$content = Fix-Mojibake -HexStr "C3-A2-E2-82-AC-E2-80-9C" -Replacement "–"

Set-Content -Path $path -Value $content -Encoding UTF8 -NoNewline

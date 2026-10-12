$file = 'd:\Antigravity\E-Portofolio PPG\index_merged.html'
$content = Get-Content $file -Raw -Encoding UTF8
$start_marker = "    <!-- PENGALAMAN SECTION -->"
$end_marker = "    <!-- ARTEFAK SECTION -->"

$start_idx = $content.IndexOf($start_marker)
$end_idx = $content.IndexOf($end_marker)

$pengalaman = $content.Substring($start_idx, $end_idx - $start_idx)
Set-Content 'd:\Antigravity\E-Portofolio PPG\pengalaman_backup.html' -Value $pengalaman -Encoding UTF8

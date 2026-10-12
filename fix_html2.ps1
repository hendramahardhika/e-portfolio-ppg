$content = Get-Content -Raw -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Encoding UTF8

$hudStart = $content.IndexOf('<div id="semester-screen"')
$hudEndStr = '<!-- SEMESTER 1 SCREEN (SIMPLE OLD STYLE) -->'
$hudEnd = $content.IndexOf($hudEndStr)
$hudHtml = $content.Substring($hudStart, $hudEnd - $hudStart).Trim()

# --- SEMESTER 1 SCREEN ---
$sem1Html = $hudHtml.Replace('id="semester-screen"', 'id="semester1-screen"')
$sem1Html = $sem1Html.Replace('PILIH HALAMAN', 'E-PORTFOLIO UTS & UAS')
$sem1Html = $sem1Html.Replace('Pilih e-portofolio yang ingin dibuka', 'E-Portfolio Semester 1')
$sem1Html = $sem1Html.Replace('id="btn-semester1"', 'id="btn-sem1-port1"')
$sem1Html = $sem1Html.Replace('id="btn-semester2"', 'id="btn-sem1-port2"')
$sem1Html = $sem1Html.Replace('SEMESTER 1</div>', 'UTS</div>')
$sem1Html = $sem1Html.Replace('SEMESTER 2</div>', 'UAS</div>')
$sem1Html = $sem1Html.Replace('<h3>Semester 1</h3>', '<h3>E-Portfolio 1</h3>')
$sem1Html = $sem1Html.Replace('<h3>Semester 2</h3>', '<h3>E-Portfolio 2</h3>')
$sem1Html = $sem1Html.Replace('Berisi filosofi pendidikan, pemahaman peserta didik, pembelajaran, refleksi, dan PPL terbimbing.', 'Dokumentasi perjalanan profesional, karya, dan refleksi pembelajaran selama PPG Prajabatan 2026.')
$sem1Html = $sem1Html.Replace('Berisi pembelajaran mendalam, asesmen, kepemimpinan, proyek, dan PPL mandiri.', 'Refleksi akhir Praktik Pengalaman Lapangan Terbimbing dan Filosofi Mengajar.')
$sem1Html = $sem1Html.Replace('Buka Semester 1 <i', 'Buka E-Portfolio 1 <i')
$sem1Html = $sem1Html.Replace('Buka Semester 2 <i', 'Buka E-Portfolio 2 <i')
$sem1Html = $sem1Html.Replace('ph-book-open', 'ph-books')
$sem1Html = $sem1Html.Replace('ph-trend-up', 'ph-target')

$backBtnSem1 = @"
<div style="display: flex; justify-content: center; z-index: 10;">
            <div id="btn-back-semester1" style="display: inline-flex; align-items: center; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); border-radius: 4px; overflow: hidden; cursor: pointer; transition: all 0.3s ease; backdrop-filter: blur(5px); padding: 0.3rem;" onmouseover="this.style.background='rgba(255,255,255,0.15)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'">
                <div style="background: #06B6D4; width: 34px; height: 34px; display: flex; justify-content: center; align-items: center; color: white; font-size: 1.2rem; border-radius: 3px;">
                    <i class="ph ph-arrow-left"></i>
                </div>
                <div style="padding: 0 1.2rem; color: #F8FAFC; font-weight: 600; font-size: 0.95rem;">
                    Pilih semester lain
                </div>
            </div>
        </div>
"@

$sem1Html = $sem1Html -replace '(?s)<!-- Bottom Instruction -->.*?</div>\s*</div>', ("<!-- Back Button -->`n        " + $backBtnSem1 + "`n    </div>")


# --- SELECTION SCREEN ---
$selHtml = $hudHtml.Replace('id="semester-screen"', 'id="selection-screen"')
$selHtml = $selHtml.Replace('PILIH HALAMAN', 'E-PORTFOLIO UTS & UAS')
$selHtml = $selHtml.Replace('Pilih e-portofolio yang ingin dibuka', 'E-Portfolio Semester 1')
$selHtml = $selHtml.Replace('id="btn-semester1"', 'id="btn-portfolio1"')
$selHtml = $selHtml.Replace('id="btn-semester2"', 'id="btn-portfolio2"')
$selHtml = $selHtml.Replace('SEMESTER 1</div>', 'UTS</div>')
$selHtml = $selHtml.Replace('SEMESTER 2</div>', 'UAS</div>')
$selHtml = $selHtml.Replace('<h3>Semester 1</h3>', '<h3>E-Portfolio 1</h3>')
$selHtml = $selHtml.Replace('<h3>Semester 2</h3>', '<h3>E-Portfolio 2</h3>')
$selHtml = $selHtml.Replace('Berisi filosofi pendidikan, pemahaman peserta didik, pembelajaran, refleksi, dan PPL terbimbing.', 'Dokumentasi perjalanan profesional, karya, dan refleksi pembelajaran selama PPG Prajabatan 2026.')
$selHtml = $selHtml.Replace('Berisi pembelajaran mendalam, asesmen, kepemimpinan, proyek, dan PPL mandiri.', 'Refleksi akhir Praktik Pengalaman Lapangan Terbimbing dan Filosofi Mengajar.')
$selHtml = $selHtml.Replace('Buka Semester 1 <i', 'Buka E-Portfolio 1 <i')
$selHtml = $selHtml.Replace('Buka Semester 2 <i', 'Buka E-Portfolio 2 <i')
$selHtml = $selHtml.Replace('ph-book-open', 'ph-books')
$selHtml = $selHtml.Replace('ph-trend-up', 'ph-target')

$backBtnSel = @"
<div style="display: flex; justify-content: center; z-index: 10;">
            <div id="btn-back-selection" onclick="window.history.back();" style="display: inline-flex; align-items: center; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); border-radius: 4px; overflow: hidden; cursor: pointer; transition: all 0.3s ease; backdrop-filter: blur(5px); padding: 0.3rem;" onmouseover="this.style.background='rgba(255,255,255,0.15)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'">
                <div style="background: #06B6D4; width: 34px; height: 34px; display: flex; justify-content: center; align-items: center; color: white; font-size: 1.2rem; border-radius: 3px;">
                    <i class="ph ph-arrow-left"></i>
                </div>
                <div style="padding: 0 1.2rem; color: #F8FAFC; font-weight: 600; font-size: 0.95rem;">
                    Pilih semester lain
                </div>
            </div>
        </div>
"@

$selHtml = $selHtml -replace '(?s)<!-- Bottom Instruction -->.*?</div>\s*</div>', ("<!-- Back Button -->`n        " + $backBtnSel + "`n    </div>")


# First, do the selection screen (so indices for semester1 don't shift)
$selStartSearch = '<style>' + "`n" + '        .semester-card:hover {'
$selStart = $content.IndexOf($selStartSearch)
$selEnd = $content.IndexOf('<!-- Navigation -->', $selStart)

$preservedStyle = @"
<style>
        .semester-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 150, 255, 0.6), inset 0 0 20px rgba(100, 200, 255, 0.2) !important;
        }
        #semester-screen.hidden {
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
        }
</style>
"@

$newSel = "$preservedStyle`n    <!-- SELECTION SCREEN (UPDATED) -->`n$selHtml`n`n    "
$content = $content.Substring(0, $selStart) + $newSel + $content.Substring($selEnd)

# Now, do semester 1 screen
$sem1Start = $content.IndexOf('<!-- SEMESTER 1 SCREEN (SIMPLE OLD STYLE) -->')
$sem1End = $content.IndexOf('<script>', $sem1Start)
$newSem1 = "<!-- SEMESTER 1 SCREEN (UPDATED) -->`n$sem1Html`n`n    "
$content = $content.Substring(0, $sem1Start) + $newSem1 + $content.Substring($sem1End)


Set-Content -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Value $content -Encoding UTF8
Write-Output "Done!"

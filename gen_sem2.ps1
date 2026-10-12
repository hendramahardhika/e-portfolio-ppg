$content = Get-Content -Raw -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Encoding UTF8

$sem1Start = $content.IndexOf('<div id="semester1-screen"')
$sem1End = $content.IndexOf('<!-- SEMESTER 1 SCREEN (SIMPLE OLD STYLE) -->', $sem1Start)
if ($sem1End -eq -1) {
    $sem1End = $content.IndexOf('<script>', $sem1Start)
}
$sem1Html = $content.Substring($sem1Start, $sem1End - $sem1Start)

$sem2Html = $sem1Html -replace 'id="semester1-screen"', 'id="semester2-screen"'
$sem2Html = $sem2Html -replace 'E-Portfolio Semester 1', 'E-Portfolio Semester 2'
$sem2Html = $sem2Html -replace 'id="btn-back-semester1"', 'id="btn-back-semester2"'
$sem2Html = $sem2Html -replace 'E-PORTFOLIO UTS & UAS', 'E-PORTFOLIO SEMINAR & UAS'

# Now we need to replace the cards section.
$cardsRegex = '(?s)<div class="semester-cards"[\s\S]*?(?=<!-- Bottom Instruction -->|<!-- Back Button -->)'
$newCards = @'
<div class="semester-cards" style="display: flex; gap: 1.5rem; max-width: 1100px; width: 95%; justify-content: center; flex-wrap: wrap;">
            <!-- Card 1: Seminar PPG -->
            <div class="semester-card" id="btn-sem2-port1" style="background: rgba(15, 30, 80, 0.5); backdrop-filter: blur(10px); border: 2px solid rgba(100, 200, 255, 0.4); border-radius: 16px; box-shadow: 0 0 20px rgba(0, 150, 255, 0.3), inset 0 0 15px rgba(100, 200, 255, 0.1); padding: 1.5rem; flex: 1; min-width: 250px; max-width: 320px; position: relative; overflow: hidden; display: flex; flex-direction: column; transition: all 0.3s ease; cursor: pointer; align-items: center; text-align: center;">
                <div style="display: flex; justify-content: flex-end; width: 100%; margin-bottom: 0.5rem;">
                    <div style="background: rgba(6, 182, 212, 0.8); border: 1px solid rgba(100, 200, 255, 0.8); color: #FFF; padding: 0.2rem 0.8rem; border-radius: 20px; font-size: 0.7rem; font-weight: 700; letter-spacing: 0.5px; box-shadow: 0 0 10px rgba(6,182,212,0.5);">PROTOTIPE</div>
                </div>
                
                <div style="width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 2.2rem; color: #F59E0B; margin-bottom: 1rem; filter: drop-shadow(0 0 10px rgba(245, 158, 11, 0.4));">
                    <i class="ph-fill ph-graduation-cap" style="color: #6366f1;"></i>
                </div>
                
                <h3 style="color: #F8FAFC; font-size: 1.4rem; margin-bottom: 0.8rem; font-weight: 700;">Seminar PPG</h3>
                
                <p style="color: #94A3B8; font-size: 0.85rem; line-height: 1.4; margin-bottom: 1.5rem; flex-grow: 1;">Galeri presentasi reflektif dan karya inovasi pendidikan</p>
                
                <div style="color: #4ADE80; font-weight: 600; font-size: 0.9rem; margin-top: auto; display: flex; align-items: center; gap: 0.3rem;">Buka Ruang Presentasi <i class="ph ph-arrow-right"></i></div>
            </div>

            <!-- Card 2: E-Portfolio 1 (Terkunci) -->
            <div class="semester-card" style="background: rgba(15, 30, 80, 0.3); backdrop-filter: blur(10px); border: 2px solid rgba(100, 110, 140, 0.4); border-radius: 16px; padding: 1.5rem; flex: 1; min-width: 250px; max-width: 320px; position: relative; overflow: hidden; display: flex; flex-direction: column; align-items: center; text-align: center; opacity: 0.8;">
                <div style="display: flex; justify-content: flex-end; width: 100%; margin-bottom: 0.5rem;">
                    <div style="background: rgba(50, 60, 80, 0.8); border: 1px solid rgba(100, 110, 140, 0.5); color: #CBD5E1; padding: 0.2rem 0.8rem; border-radius: 20px; font-size: 0.7rem; font-weight: 700; letter-spacing: 0.5px;">BELUM DIBUKA</div>
                </div>
                
                <div style="width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 2.2rem; color: #94A3B8; margin-bottom: 1rem;">
                    <i class="ph-fill ph-clipboard-text"></i>
                </div>
                
                <h3 style="color: #F8FAFC; font-size: 1.4rem; margin-bottom: 0.8rem; font-weight: 700;">E-Portfolio 1</h3>
                
                <p style="color: #94A3B8; font-size: 0.85rem; line-height: 1.4; margin-bottom: 1rem; flex-grow: 1;">Enam analisis praktik mengajar mandiri</p>
                
                <button style="background: rgba(30, 41, 59, 0.8); border: 1px solid rgba(71, 85, 105, 0.5); color: #CBD5E1; padding: 0.5rem 1.2rem; border-radius: 20px; font-weight: 600; font-size: 0.8rem; display: flex; justify-content: center; align-items: center; gap: 0.4rem; width: max-content; margin-bottom: 0.8rem; cursor: not-allowed;"><i class="ph-fill ph-lock-key"></i> TERKUNCI</button>
                <div style="color: #64748B; font-size: 0.75rem;">Akan dibuka kemudian</div>
            </div>

            <!-- Card 3: E-Portfolio 2 (Terkunci) -->
            <div class="semester-card" style="background: rgba(15, 30, 80, 0.3); backdrop-filter: blur(10px); border: 2px solid rgba(100, 110, 140, 0.4); border-radius: 16px; padding: 1.5rem; flex: 1; min-width: 250px; max-width: 320px; position: relative; overflow: hidden; display: flex; flex-direction: column; align-items: center; text-align: center; opacity: 0.8;">
                <div style="display: flex; justify-content: flex-end; width: 100%; margin-bottom: 0.5rem;">
                    <div style="background: rgba(50, 60, 80, 0.8); border: 1px solid rgba(100, 110, 140, 0.5); color: #CBD5E1; padding: 0.2rem 0.8rem; border-radius: 20px; font-size: 0.7rem; font-weight: 700; letter-spacing: 0.5px;">BELUM DIBUKA</div>
                </div>
                
                <div style="width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 2.2rem; color: #F43F5E; margin-bottom: 1rem; filter: drop-shadow(0 0 5px rgba(244, 63, 94, 0.3));">
                    <i class="ph-fill ph-target"></i>
                </div>
                
                <h3 style="color: #F8FAFC; font-size: 1.4rem; margin-bottom: 0.8rem; font-weight: 700;">E-Portfolio 2</h3>
                
                <p style="color: #94A3B8; font-size: 0.85rem; line-height: 1.4; margin-bottom: 1rem; flex-grow: 1;">Refleksi akhir Praktik Pengalaman Lapangan Mandiri</p>
                
                <button style="background: rgba(30, 41, 59, 0.8); border: 1px solid rgba(71, 85, 105, 0.5); color: #CBD5E1; padding: 0.5rem 1.2rem; border-radius: 20px; font-weight: 600; font-size: 0.8rem; display: flex; justify-content: center; align-items: center; gap: 0.4rem; width: max-content; margin-bottom: 0.8rem; cursor: not-allowed;"><i class="ph-fill ph-lock-key"></i> TERKUNCI</button>
                <div style="color: #64748B; font-size: 0.75rem;">Akan segera hadir</div>
            </div>
        </div>
        </div>
        
'@

$sem2Html = $sem2Html -replace $cardsRegex, $newCards

$content = $content.Replace($sem1Html, "$sem1Html`n`n$sem2Html")

$cssOld = '#semester-screen.hidden, #semester1-screen.hidden {'
$cssNew = '#semester-screen.hidden, #semester1-screen.hidden, #semester2-screen.hidden {'
$content = $content.Replace($cssOld, $cssNew)

$jsOld = "    const btnSemester2 = document.getElementById('btn-semester2');`n    if (btnSemester2) {`n        btnSemester2.addEventListener('click', function(e) {`n            e.preventDefault();`n            alert('Konten Semester 2 belum tersedia saat ini.');`n        });`n    }"
$jsNew = "    const btnSemester2 = document.getElementById('btn-semester2');`n    const screenSem2 = document.getElementById('semester2-screen');`n    if (btnSemester2 && screenSem2) {`n        btnSemester2.addEventListener('click', function(e) {`n            e.preventDefault();`n            document.getElementById('semester-screen').classList.add('hidden');`n            setTimeout(() => {`n                screenSem2.classList.remove('hidden');`n            }, 500);`n        });`n    }"

# Normalize line endings to avoid failure in replacement
$content = $content -replace '(?s)    const btnSemester2 = document\.getElementById\(''btn-semester2''\);.*?\}\);(?:\r?\n)    \}', $jsNew

$sem1BackJs = "        if (btnBackSem1 && screenSem && screenSem1) {`n            btnBackSem1.addEventListener('click', () => {`n                screenSem1.classList.add('hidden');`n                setTimeout(() => {`n                    screenSem.classList.remove('hidden');`n                }, 500);`n            });`n        }"

$sem1BackRegex = '(?s)        if \(btnBackSem1 && screenSem && screenSem1\) \{.*?        \}'

$backJs = "
        const btnBackSem2 = document.getElementById('btn-back-semester2');
        if (btnBackSem2 && screenSem2) {
            btnBackSem2.addEventListener('click', () => {
                screenSem2.classList.add('hidden');
                setTimeout(() => {
                    document.getElementById('semester-screen').classList.remove('hidden');
                }, 500);
            });
        }

        const btnSem2Port1 = document.getElementById('btn-sem2-port1');
        if (btnSem2Port1) {
            btnSem2Port1.addEventListener('click', () => {
                alert('Ruang Presentasi Seminar PPG sedang dalam tahap pengembangan.');
            });
        }
"

# Instead of replace regex, we can just insert before `// Handle E-Portfolio 1 card click`
$insertAnchor = '// Handle E-Portfolio 1 card click'
$content = $content.Replace($insertAnchor, "$backJs`n`n        $insertAnchor")

Set-Content -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Value $content -Encoding UTF8
Write-Output "Done generating semester2-screen!"

$html_template = @"
            <div class="refleksi-card reveal reveal-active" style="border-top: 5px solid {color};">
                <h3 class="refleksi-title" style="font-family: var(--font-body); font-weight: 700; color: #1e3a8a; font-size: 1.25rem; margin-bottom: 0.75rem;">{title}</h3>
                <p class="refleksi-desc" style="color: var(--text-muted); font-size: 0.9rem; line-height: 1.6; margin-bottom: 1.25rem; flex-grow: 1;">{desc}</p>
                <div class="refleksi-viewer portfolio-img-wrapper" style="position: relative; width: 100%; padding-top: 56.25%; background-color: #f1f5f9; border-radius: 8px; overflow: hidden; margin-bottom: 1.5rem; border: 1px solid #e2e8f0;">
                    <img src="{img}" alt="Cover" class="refleksi-viewer-bg portfolio-img" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;">
                    <div class="refleksi-controls" style="position: absolute; bottom: 0; left: 0; right: 0; background: rgba(15, 23, 42, 0.85); backdrop-filter: blur(4px); color: #ffffff; padding: 8px 16px; display: flex; justify-content: space-between; align-items: center; font-size: 0.85rem;">
                        <span>Halaman &nbsp; 1 &nbsp; / &nbsp; 10</span>
                        <div class="refleksi-zoom" style="display: flex; align-items: center; gap: 12px; font-size: 1rem;">
                            <i class="ph-bold ph-minus"></i>
                            <i class="ph-bold ph-plus"></i>
                            <i class="ph-bold ph-magnifying-glass"></i>
                        </div>
                    </div>
                    <!-- Hover Overlay -->
                    <a href="{pdf_link}" target="_blank" class="pdf-overlay" style="z-index: 20;">
                        <span class="glass-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" style="vertical-align: middle; margin-right: 4px;">
                                <path d="M6 2H14L20 8V20C20 21.1 19.1 22 18 22H6C4.9 22 4 21.1 4 20V4C4 2.9 4.9 2 6 2Z" fill="#1e3a8a" />
                                <path d="M14 2V8H20L14 2Z" fill="#3b82f6" />
                                <rect x="7" y="11" width="10" height="7" rx="1.5" fill="#ef4444" />
                                <text x="12" y="16" font-family="'Inter', sans-serif" font-size="5.2" font-weight="900" fill="white" text-anchor="middle" letter-spacing="0.1">PDF</text>
                            </svg>
                            Buka PDF di Drive
                        </span>
                    </a>
                </div>
                <div class="refleksi-btn-row" style="display: flex; gap: 10px; margin-top: auto;">
                    <a href="#" class="btn-ref-blue" style="flex: 1; background: #1d4ed8; color: white; border: none; padding: 10px 0; border-radius: 20px; font-weight: 600; font-size: 0.9rem; cursor: pointer; transition: 0.2s; text-align: center; text-decoration: none;">Preview 2</a>
                    <a href="#" class="btn-ref-green" style="flex: 1; background: #10b981; color: white; border: none; padding: 10px 0; border-radius: 20px; font-weight: 600; font-size: 0.9rem; cursor: pointer; transition: 0.2s; text-align: center; text-decoration: none;">Lihat Refleksi</a>
                </div>
            </div>
"@

$sem2_data = @(
    @{ color="#3b82f6"; title="Pembelajaran Sosial Emosional"; desc="Mereviu dan merefleksi pengalaman belajar Mata Kuliah Pembelajaran Sosial Emosional."; img="media-cover.png"; pdf="#" },
    @{ color="#10b981"; title="Pembelajaran Mendalam dan Asesmen Lanjut"; desc="Mereviu dan merefleksi pengalaman belajar Mata Kuliah Pembelajaran Mendalam dan Asesmen Lanjut."; img="rpp-cover.png"; pdf="#" },
    @{ color="#f59e0b"; title="Praktik Pengalaman Lapangan (PPL) Mandiri"; desc="Mereviu dan merefleksi pengalaman belajar Mata Kuliah PPL Mandiri."; img="materi-cover.png"; pdf="#" },
    @{ color="#8b5cf6"; title="Projek Kepemimpinan"; desc="Mereviu dan merefleksi pengalaman belajar Mata Kuliah Projek Kepemimpinan."; img="media-cover.png"; pdf="#" },
    @{ color="#ef4444"; title="Pilihan Selektif / Elektif"; desc="Mereviu dan merefleksi pengalaman belajar Mata Kuliah Pilihan Selektif/Elektif."; img="rpp-cover.png"; pdf="#" }
)

$sem2_html = "        <div class=`"portfolio-grid`" id=`"grid-sem2-ref`" style=`"display: none;`">`n"
foreach ($item in $sem2_data) {
    $sem2_html += $html_template -replace '\{color\}', $item.color -replace '\{title\}', $item.title -replace '\{desc\}', $item.desc -replace '\{img\}', $item.img -replace '\{pdf_link\}', $item.pdf
    $sem2_html += "`n"
}
$sem2_html += "        </div>"


$content = [System.IO.File]::ReadAllText('d:\Antigravity\E-Portofolio PPG\index.html')
$content = $content -replace '(?s)<div class="portfolio-grid" id="grid-sem2-ref" style="display: none;">.*?</div>', $sem2_html

# Add the script if missing
if (-not ($content -match 'function showSemRefleksi')) {
    $script = @"
    <script>
        function showSemRefleksi(sem) {
            const grid1 = document.getElementById('grid-sem1-ref');
            const grid2 = document.getElementById('grid-sem2-ref');
            const btn1 = document.getElementById('btn-sem1-ref');
            const btn2 = document.getElementById('btn-sem2-ref');
            
            if (sem === 1) {
                grid1.style.display = 'grid';
                grid2.style.display = 'none';
                btn1.classList.add('active');
                btn2.classList.remove('active');
            } else {
                grid1.style.display = 'none';
                grid2.style.display = 'grid';
                btn1.classList.remove('active');
                btn2.classList.add('active');
            }
        }
    </script>
</body>
"@
    $content = $content -replace '</body>', $script
}

[System.IO.File]::WriteAllText('d:\Antigravity\E-Portofolio PPG\index.html', $content)


$content2 = [System.IO.File]::ReadAllText('d:\Antigravity\E-Portofolio PPG\sem2_inject.html')
$content2 = $content2 -replace '(?s)<div class="portfolio-grid" id="grid-sem2-ref" style="display: none;">.*?</div>', $sem2_html
[System.IO.File]::WriteAllText('d:\Antigravity\E-Portofolio PPG\sem2_inject.html', $content2)

Write-Host "Done"

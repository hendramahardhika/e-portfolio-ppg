$content = Get-Content -Path "d:\Antigravity\E-Portofolio PPG\index.html" -Raw

$oldNav = @"
            <ul class="nav-links-modern">
                <li><a href="#hero" class="nav-link-modern active">Beranda</a></li>
                <li><a href="#profil" class="nav-link-modern">Profil</a></li>
                <li><a href="#pendidikan" class="nav-link-modern">Pendidikan</a></li>
                <li><a href="#artefak" class="nav-link-modern">Artefak</a></li>
                <li><a href="#analisis" class="nav-link-modern">Analisis</a></li>
                <li><a href="#penilaian" class="nav-link-modern">Penilaian</a></li>
                <li><a href="#model-guru" class="nav-link-modern">Model Guru</a></li>
                <li><a href="#galeri" class="nav-link-modern">Galeri</a></li>
                <li><a href="#kontak" class="nav-link-modern">Kontak</a></li>
            </ul>
"@

$newNav = @"
            <ul class="nav-links-modern">
                <li><a href="#hero" class="nav-link-modern active">Beranda</a></li>
                <li><a href="#profil" class="nav-link-modern">Identifikasi Diri</a></li>
                <li><a href="#artefak" class="nav-link-modern">Refleksi Mata Kuliah</a></li>
                <li><a href="#analisis" class="nav-link-modern">Refleksi Keseluruhan</a></li>
                <li><a href="#model-guru" class="nav-link-modern">Inovasi Terbaru</a></li>
            </ul>
"@

$content = $content.Replace($oldNav, $newNav)
$content = $content.Replace("p1Elements.forEach(el => el.style.display = 'none');", "p1Elements.forEach(el => el.style.display = '');")

$overrideStyle = @"
    <style>
        #selection-screen, #semester-screen, #semester1-screen, #semester2-screen { display: none !important; opacity: 0 !important; pointer-events: none !important; }
        body.splash-active { overflow: auto !important; height: auto !important; }
        #splash-screen { display: none !important; }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            document.body.classList.remove('splash-active');
            const p1 = document.querySelectorAll('nav#navbar, header#hero, section#profil, section#pendidikan, section#artefak, section#analisis, section#penilaian, section#model-guru, section#galeri, section#kontak, footer, div#portfolio-modal, div#pdf-modal, div#gallery-modal');
            p1.forEach(el => {
                if(el) el.style.display = '';
            });
            const p2 = document.getElementById('portfolio-content-2');
            if(p2) p2.style.display = 'none';
        });
    </script>
</body>
"@

$content = $content.Replace("</body>", $overrideStyle)
$content = $content.Replace("<title>E-Portfolio PPG Prajabatan | Pendidik Profesional</title>", "<title>PROTOTIPE Seminar PPG | Semester 2</title>")
$content = $content.Replace('<h3 style="color: #F8FAFC; font-size: 1.4rem; margin-bottom: 0.8rem; font-weight: 700;">Semester 1</h3>', '<h3 style="color: #F8FAFC; font-size: 1.4rem; margin-bottom: 0.8rem; font-weight: 700;">Semester 2 PROTOTIPE</h3>')
$content = $content.Replace('id="back-to-selection" class="nav-util-btn-modern"', 'href="index.html" class="nav-util-btn-modern"')
$content = $content.Replace("document.getElementById('back-to-selection').addEventListener('click'", "// removed back-to-selection")

[System.IO.File]::WriteAllText("d:\Antigravity\E-Portofolio PPG\semester2.html", $content, [System.Text.Encoding]::UTF8)

Write-Host "semester2.html created successfully."

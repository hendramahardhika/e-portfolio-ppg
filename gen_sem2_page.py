import re

def main():
    with open('d:/Antigravity/E-Portofolio PPG/index.html', 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Update the Navbar
    old_nav = """            <ul class="nav-links-modern">
                <li><a href="#hero" class="nav-link-modern active">Beranda</a></li>
                <li><a href="#profil" class="nav-link-modern">Profil</a></li>
                <li><a href="#pendidikan" class="nav-link-modern">Pendidikan</a></li>
                <li><a href="#artefak" class="nav-link-modern">Artefak</a></li>
                <li><a href="#analisis" class="nav-link-modern">Analisis</a></li>
                <li><a href="#penilaian" class="nav-link-modern">Penilaian</a></li>
                <li><a href="#model-guru" class="nav-link-modern">Model Guru</a></li>
                <li><a href="#galeri" class="nav-link-modern">Galeri</a></li>
                <li><a href="#kontak" class="nav-link-modern">Kontak</a></li>
            </ul>"""
            
    new_nav = """            <ul class="nav-links-modern">
                <li><a href="#hero" class="nav-link-modern active">Beranda</a></li>
                <li><a href="#profil" class="nav-link-modern">Identifikasi Diri</a></li>
                <li><a href="#artefak" class="nav-link-modern">Refleksi Mata Kuliah</a></li>
                <li><a href="#analisis" class="nav-link-modern">Refleksi Keseluruhan</a></li>
                <li><a href="#model-guru" class="nav-link-modern">Inovasi Terbaru</a></li>
            </ul>"""

    if old_nav in content:
        content = content.replace(old_nav, new_nav)
    else:
        # Regex fallback in case of whitespace differences
        content = re.sub(r'<ul class="nav-links-modern">.*?</ul>', new_nav, content, flags=re.DOTALL)

    # 2. Modify JS to skip the selection screens and show content directly
    content = content.replace("p1Elements.forEach(el => el.style.display = 'none');", "p1Elements.forEach(el => el.style.display = '');")
    
    override_style = """
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
"""
    content = content.replace('</body>', override_style)

    # 3. Update Title
    content = content.replace('<title>E-Portfolio PPG Prajabatan | Pendidik Profesional</title>', '<title>PROTOTIPE Seminar PPG | Semester 2</title>')
    
    content = content.replace('id="back-to-selection" class="nav-util-btn-modern"', 'href="index.html" class="nav-util-btn-modern"')
    content = content.replace("document.getElementById('back-to-selection').addEventListener('click'", "// removed back-to-selection")
    
    with open('d:/Antigravity/E-Portofolio PPG/semester2.html', 'w', encoding='utf-8') as f:
        f.write(content)

    print("semester2.html created successfully.")

if __name__ == '__main__':
    main()

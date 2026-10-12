import re

with open('d:/Antigravity/E-Portofolio PPG/index.html', 'r', encoding='utf-8') as f:
    content = f.read()

hud_start = content.find('<div id="semester-screen"')
hud_end = content.find('<!-- SEMESTER 1 SCREEN (SIMPLE OLD STYLE) -->')
hud_html = content[hud_start:hud_end].strip()

# Create semester1-screen
sem1_html = hud_html.replace('id="semester-screen"', 'id="semester1-screen"')
sem1_html = sem1_html.replace('PILIH HALAMAN', 'E-PORTFOLIO UTS & UAS')
sem1_html = sem1_html.replace('Pilih e-portofolio yang ingin dibuka', 'E-Portfolio Semester 1')

sem1_html = sem1_html.replace('id="btn-semester1"', 'id="btn-sem1-port1"')
sem1_html = sem1_html.replace('id="btn-semester2"', 'id="btn-sem1-port2"')

# In hud_html, the labels for pills are:
# <div style="...">SEMESTER 1</div> and SEMESTER 2</div>
sem1_html = sem1_html.replace('SEMESTER 1</div>', 'UTS</div>')
sem1_html = sem1_html.replace('SEMESTER 2</div>', 'UAS</div>')

sem1_html = sem1_html.replace('<h3>Semester 1</h3>', '<h3>E-Portfolio 1</h3>')
sem1_html = sem1_html.replace('<h3>Semester 2</h3>', '<h3>E-Portfolio 2</h3>')

sem1_html = sem1_html.replace('Berisi filosofi pendidikan, pemahaman peserta didik, pembelajaran, refleksi, dan PPL terbimbing.', 'Dokumentasi perjalanan profesional, karya, dan refleksi pembelajaran selama PPG Prajabatan 2026.')
sem1_html = sem1_html.replace('Berisi pembelajaran mendalam, asesmen, kepemimpinan, proyek, dan PPL mandiri.', 'Refleksi akhir Praktik Pengalaman Lapangan Terbimbing dan Filosofi Mengajar.')

sem1_html = sem1_html.replace('Buka Semester 1 <i', 'Buka E-Portfolio 1 <i')
sem1_html = sem1_html.replace('Buka Semester 2 <i', 'Buka E-Portfolio 2 <i')

sem1_html = sem1_html.replace('ph-book-open', 'ph-books')
sem1_html = sem1_html.replace('ph-trend-up', 'ph-target')

back_btn_sem1 = '''<div style="display: flex; justify-content: center; z-index: 10;">
            <div id="btn-back-semester1" style="display: inline-flex; align-items: center; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); border-radius: 4px; overflow: hidden; cursor: pointer; transition: all 0.3s ease; backdrop-filter: blur(5px); padding: 0.3rem;" onmouseover="this.style.background='rgba(255,255,255,0.15)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'">
                <div style="background: #06B6D4; width: 34px; height: 34px; display: flex; justify-content: center; align-items: center; color: white; font-size: 1.2rem; border-radius: 3px;">
                    <i class="ph ph-arrow-left"></i>
                </div>
                <div style="padding: 0 1.2rem; color: #F8FAFC; font-weight: 600; font-size: 0.95rem;">
                    Pilih semester lain
                </div>
            </div>
        </div>'''
sem1_html = re.sub(r'<!-- Bottom Instruction -->.*?</div>\s*</div>', f'<!-- Back Button -->\n        {back_btn_sem1}\n    </div>', sem1_html, flags=re.DOTALL)

# Create selection-screen
sel_html = hud_html.replace('id="semester-screen"', 'id="selection-screen"')
sel_html = sel_html.replace('PILIH HALAMAN', 'E-PORTFOLIO UTS & UAS')
sel_html = sel_html.replace('Pilih e-portofolio yang ingin dibuka', 'E-Portfolio Semester 1')

sel_html = sel_html.replace('id="btn-semester1"', 'id="btn-portfolio1"')
sel_html = sel_html.replace('id="btn-semester2"', 'id="btn-portfolio2"')

sel_html = sel_html.replace('SEMESTER 1</div>', 'UTS</div>')
sel_html = sel_html.replace('SEMESTER 2</div>', 'UAS</div>')

sel_html = sel_html.replace('<h3>Semester 1</h3>', '<h3>E-Portfolio 1</h3>')
sel_html = sel_html.replace('<h3>Semester 2</h3>', '<h3>E-Portfolio 2</h3>')

sel_html = sel_html.replace('Berisi filosofi pendidikan, pemahaman peserta didik, pembelajaran, refleksi, dan PPL terbimbing.', 'Dokumentasi perjalanan profesional, karya, dan refleksi pembelajaran selama PPG Prajabatan 2026.')
sel_html = sel_html.replace('Berisi pembelajaran mendalam, asesmen, kepemimpinan, proyek, dan PPL mandiri.', 'Refleksi akhir Praktik Pengalaman Lapangan Terbimbing dan Filosofi Mengajar.')

sel_html = sel_html.replace('Buka Semester 1 <i', 'Buka E-Portfolio 1 <i')
sel_html = sel_html.replace('Buka Semester 2 <i', 'Buka E-Portfolio 2 <i')

sel_html = sel_html.replace('ph-book-open', 'ph-books')
sel_html = sel_html.replace('ph-trend-up', 'ph-target')

back_btn_sel = '''<div style="display: flex; justify-content: center; z-index: 10;">
            <div id="btn-back-selection" onclick="window.history.back();" style="display: inline-flex; align-items: center; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); border-radius: 4px; overflow: hidden; cursor: pointer; transition: all 0.3s ease; backdrop-filter: blur(5px); padding: 0.3rem;" onmouseover="this.style.background='rgba(255,255,255,0.15)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'">
                <div style="background: #06B6D4; width: 34px; height: 34px; display: flex; justify-content: center; align-items: center; color: white; font-size: 1.2rem; border-radius: 3px;">
                    <i class="ph ph-arrow-left"></i>
                </div>
                <div style="padding: 0 1.2rem; color: #F8FAFC; font-weight: 600; font-size: 0.95rem;">
                    Pilih semester lain
                </div>
            </div>
        </div>'''
sel_html = re.sub(r'<!-- Bottom Instruction -->.*?</div>\s*</div>', f'<!-- Back Button -->\n        {back_btn_sel}\n    </div>', sel_html, flags=re.DOTALL)

sem1_start = content.find('<!-- SEMESTER 1 SCREEN (SIMPLE OLD STYLE) -->')
sem1_end = content.find('<script>', sem1_start)
old_sem1 = content[sem1_start:sem1_end]

content = content.replace(old_sem1, f"<!-- SEMESTER 1 SCREEN (UPDATED) -->\n{sem1_html}\n\n    ")

# selection-screen replacement
sel_start_search = '<style>\n        .semester-card:hover {'
sel_start = content.find(sel_start_search)
sel_end = content.find('<!-- Navigation -->', sel_start)
old_sel = content[sel_start:sel_end]

# We should preserve the style for .semester-card:hover
preserved_style = """<style>
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
"""

content = content.replace(old_sel, f"{preserved_style}\n    <!-- SELECTION SCREEN (UPDATED) -->\n{sel_html}\n\n    ")

with open('d:/Antigravity/E-Portofolio PPG/index.html', 'w', encoding='utf-8') as f:
    f.write(content)

print("Replacement successful")

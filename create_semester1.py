import re

with open('d:/Antigravity/E-Portofolio PPG/index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Extract semester-screen block
start_idx = content.find('<div id="semester-screen"')
end_idx = content.find('    <style>', start_idx)
semester_screen_html = content[start_idx:end_idx]

# Create semester1-screen html
new_html = semester_screen_html.replace('id="semester-screen"', 'id="semester1-screen"')

# Header
new_html = new_html.replace('PILIH HALAMAN', 'SEMESTER 1')
new_html = new_html.replace('Pilih e-portofolio yang ingin dibuka', 'Pilih E-Portofolio Semester 1')

# Card 1
# Remove <ul> completely
new_html = re.sub(r'<ul.*?</ul>', '', new_html, flags=re.DOTALL)
# Remove <h5>
new_html = re.sub(r'<h5.*?>PPG PRAJABATAN</h5>', '', new_html)
new_html = re.sub(r'<h5.*?>PENGEMBANGAN PROFESI</h5>', '', new_html)

new_html = new_html.replace('ph-book-open', 'ph-graduation-cap')
new_html = new_html.replace('SEMESTER 1</div>', 'E-PORTOFOLIO 1</div>')
new_html = new_html.replace('<h3>Semester 1</h3>', '<h3>Portfolio Utama PPG</h3>')
new_html = new_html.replace('Berisi filosofi pendidikan, pemahaman peserta didik, pembelajaran, refleksi, dan PPL terbimbing.', 'Berisi profil lengkap, dokumentasi kegiatan, artefak pembelajaran, penilaian, video praktik, sertifikat, dan kontak.')
new_html = new_html.replace('Buka Semester 1 <i', 'Buka E-Portofolio 1 <i')

# Card 2
new_html = new_html.replace('ph-trend-up', 'ph-rocket')
new_html = new_html.replace('SEMESTER 2</div>', 'E-PORTOFOLIO 2</div>')
new_html = new_html.replace('<h3>Semester 2</h3>', '<h3>Refleksi PPL Terbimbing</h3>')
new_html = new_html.replace('Berisi pembelajaran mendalam, asesmen, kepemimpinan, proyek, dan PPL mandiri.', 'Berisi analisis pembelajaran, kendala & tantangan di lapangan, umpan balik konstruktif, serta inovasi pembelajaran digital.')
new_html = new_html.replace('Buka Semester 2 <i', 'Buka E-Portofolio 2 <i')

# Bottom Instruction -> Back Button
bottom_instr_match = re.search(r'<div style="color: rgba\(255,255,255,0\.7\).*?>.*?</div>', new_html, flags=re.DOTALL)
if bottom_instr_match:
    back_btn_html = '''<div style="display: flex; justify-content: center; z-index: 5;">
            <button id="btn-back-semester1" style="background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); color: white; padding: 0.5rem 1.5rem; border-radius: 20px; font-size: 0.85rem; cursor: pointer; transition: all 0.3s ease; display: flex; align-items: center; gap: 0.5rem; backdrop-filter: blur(5px);"><i class="ph ph-arrow-left"></i> Kembali ke Pemilihan Semester</button>
        </div>'''
    new_html = new_html.replace(bottom_instr_match.group(0), back_btn_html)
else:
    print("Could not find bottom instruction.")

# Also change IDs of buttons in semester1-screen to avoid conflict
new_html = new_html.replace('id="btn-semester1"', 'id="btn-eportofolio1"')
new_html = new_html.replace('id="btn-semester2"', 'id="btn-eportofolio2"')

# Add JS logic
js_logic = '''
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const btnSem1 = document.getElementById('btn-semester1');
        const screenSem = document.getElementById('semester-screen');
        const screenSem1 = document.getElementById('semester1-screen');
        const btnBackSem1 = document.getElementById('btn-back-semester1');

        if (btnSem1 && screenSem && screenSem1) {
            btnSem1.addEventListener('click', (e) => {
                screenSem.classList.add('hidden');
                setTimeout(() => {
                    screenSem1.classList.remove('hidden');
                }, 500);
            });
        }

        if (btnBackSem1 && screenSem && screenSem1) {
            btnBackSem1.addEventListener('click', () => {
                screenSem1.classList.add('hidden');
                setTimeout(() => {
                    screenSem.classList.remove('hidden');
                }, 500);
            });
            
            btnBackSem1.addEventListener('mouseover', () => {
                btnBackSem1.style.background = 'rgba(255,255,255,0.2)';
            });
            btnBackSem1.addEventListener('mouseout', () => {
                btnBackSem1.style.background = 'rgba(255,255,255,0.1)';
            });
        }
    });
    </script>
'''

new_html += js_logic

# Replace in content
final_content = content[:end_idx] + new_html + content[end_idx:]

with open('d:/Antigravity/E-Portofolio PPG/index.html', 'w', encoding='utf-8') as f:
    f.write(final_content)
print('Done!')

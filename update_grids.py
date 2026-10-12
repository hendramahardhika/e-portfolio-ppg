import re

html_template = """            <div class="refleksi-card reveal reveal-active" style="border-top: 5px solid {color};">
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
            </div>"""

sem1_data = [
    {"color": "#3b82f6", "title": "Filosofi Pendidikan dan Nilai", "desc": "Refleksi mendalam mengenai nilai-nilai filosofis pendidikan Indonesia.", "img": "materi-cover.png", "pdf": "#"},
    {"color": "#10b981", "title": "Growth Mindset", "desc": "Penerapan pola pikir berkembang bagi pendidik dan peserta didik.", "img": "media-cover.png", "pdf": "#"},
    {"color": "#f59e0b", "title": "Pemahaman Peserta Didik", "desc": "Strategi memahami karakteristik dan kebutuhan belajar siswa.", "img": "rpp-cover.png", "pdf": "#"},
    {"color": "#8b5cf6", "title": "Pembelajaran Mendalam & Asesmen Dasar", "desc": "Perancangan asesmen formatif dan sumatif yang efektif.", "img": "materi-cover.png", "pdf": "#"},
    {"color": "#ef4444", "title": "PPL Terbimbing SMK Muhammadiyah 3 Yogyakarta", "desc": "Pengalaman langsung mengajar dan membimbing di sekolah menengah kejuruan.", "img": "media-cover.png", "pdf": "#"},
    {"color": "#ec4899", "title": "Inovasi Pembelajaran Berbasis Tamansiswa", "desc": "Pengembangan pembelajaran dengan mengintegrasikan nilai-nilai luhur Tamansiswa.", "img": "rpp-cover.png", "pdf": "#"}
]

sem2_data = [
    {"color": "#3b82f6", "title": "Prinsip Pengajaran dan Asesmen (Umum)", "desc": "Refleksi merancang asesmen yang berpusat pada peserta didik.", "img": "media-cover.png", "pdf": "#"},
    {"color": "#10b981", "title": "Pembelajaran Sosial Emosional", "desc": "Penerapan kompetensi sosial emosional dalam konteks kelas.", "img": "rpp-cover.png", "pdf": "#"},
    {"color": "#f59e0b", "title": "Seminar Pendidikan Profesi Guru", "desc": "Jurnal refleksi komprehensif mengenai seluruh kegiatan seminar.", "img": "materi-cover.png", "pdf": "#"},
    {"color": "#8b5cf6", "title": "Proyek Kepemimpinan", "desc": "Desain dan inisiatif program kepemimpinan untuk perubahan di sekolah.", "img": "media-cover.png", "pdf": "#"},
    {"color": "#ef4444", "title": "Praktik Pengalaman Lapangan II", "desc": "Laporan pengajaran mandiri tingkat lanjut di sekolah mitra.", "img": "rpp-cover.png", "pdf": "#"}
]

sem1_html = '        <div class="portfolio-grid" id="grid-sem1-ref">\n'
for item in sem1_data:
    sem1_html += html_template.format(color=item["color"], title=item["title"], desc=item["desc"], img=item["img"], pdf_link=item["pdf"]) + '\n'
sem1_html += '        </div>\n\n'

sem2_html = '        <div class="portfolio-grid" id="grid-sem2-ref" style="display: none;">\n'
for item in sem2_data:
    sem2_html += html_template.format(color=item["color"], title=item["title"], desc=item["desc"], img=item["img"], pdf_link=item["pdf"]) + '\n'
sem2_html += '        </div>\n    </div>\n</section>'

new_grids = sem1_html + sem2_html

# Update index.html
with open('d:/Antigravity/E-Portofolio PPG/index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the grids
pattern = r'<div class="portfolio-grid" id="grid-sem1-ref">.*?</section>'
new_content = re.sub(pattern, new_grids, content, flags=re.DOTALL)

with open('d:/Antigravity/E-Portofolio PPG/index.html', 'w', encoding='utf-8') as f:
    f.write(new_content)

# Update sem2_inject.html
with open('d:/Antigravity/E-Portofolio PPG/sem2_inject.html', 'r', encoding='utf-8') as f:
    content2 = f.read()
    
# In sem2_inject.html, it might not end with </section> so we replace just the grids
pattern2 = r'<div class="portfolio-grid" id="grid-sem1-ref">.*'
new_grids_inject = sem1_html + '        <div class="portfolio-grid" id="grid-sem2-ref" style="display: none;">\n'
for item in sem2_data:
    new_grids_inject += html_template.format(color=item["color"], title=item["title"], desc=item["desc"], img=item["img"], pdf_link=item["pdf"]) + '\n'
new_grids_inject += '        </div>\n'

new_content2 = re.sub(pattern2, new_grids_inject, content2, flags=re.DOTALL)

with open('d:/Antigravity/E-Portofolio PPG/sem2_inject.html', 'w', encoding='utf-8') as f:
    f.write(new_content2)

print("Done")

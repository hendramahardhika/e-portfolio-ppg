const fs = require('fs');

let content = fs.readFileSync('d:/Antigravity/E-Portofolio PPG/index.html', 'utf-8');

// 1. Extract semester1-screen
let sem1_start = content.indexOf('<div id="semester1-screen"');
let sem1_end = content.indexOf('<!-- SEMESTER 1 SCREEN (SIMPLE OLD STYLE) -->', sem1_start);
if (sem1_end === -1) {
    sem1_end = content.indexOf('<script>', sem1_start);
}

let sem1_html = content.substring(sem1_start, sem1_end);

// 2. Modify to create semester2-screen
let sem2_html = sem1_html.replace(/id="semester1-screen"/g, 'id="semester2-screen"');
sem2_html = sem2_html.replace(/E-Portfolio Semester 1/g, 'E-Portfolio Semester 2');
sem2_html = sem2_html.replace(/id="btn-back-semester1"/g, 'id="btn-back-semester2"');
sem2_html = sem2_html.replace(/E-PORTFOLIO UTS & UAS/g, 'E-PORTFOLIO SEMINAR & UAS');

// Replace the cards section
let cards_start = sem2_html.indexOf('<div class="semester-cards"');
let cards_end = sem2_html.indexOf('<!-- Bottom Instruction -->');

if (cards_end === -1) {
    cards_end = sem2_html.indexOf('<!-- Back Button -->');
}
if (cards_end === -1) {
    // try finding the closing div before Bottom Instruction
    cards_end = sem2_html.indexOf('</div>\n        \n        <!-- Bottom Instruction -->');
}
// Let's just use string replacement for the entire cards div
let old_cards_match = sem2_html.match(/<div class="semester-cards"[\s\S]*?(?=<!-- Bottom Instruction -->|<!-- Back Button -->)/);
let old_cards = old_cards_match[0];

let new_cards = `<div class="semester-cards" style="display: flex; gap: 1.5rem; max-width: 1100px; width: 95%; justify-content: center; flex-wrap: wrap;">
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
        
`;

sem2_html = sem2_html.replace(old_cards, new_cards);

// Insert sem2_html after sem1_html
content = content.replace(sem1_html, sem1_html + '\n\n' + sem2_html);

// Add CSS for #semester2-screen.hidden
let css_old = '#semester-screen.hidden, #semester1-screen.hidden {';
let css_new = '#semester-screen.hidden, #semester1-screen.hidden, #semester2-screen.hidden {';
content = content.replace(css_old, css_new);

// Update btnSemester2 event listener
let js_old = `    const btnSemester2 = document.getElementById('btn-semester2');
    if (btnSemester2) {
        btnSemester2.addEventListener('click', function(e) {
            e.preventDefault();
            alert('Konten Semester 2 belum tersedia saat ini.');
        });
    }`;

let js_new = `    const btnSemester2 = document.getElementById('btn-semester2');
    const screenSem2 = document.getElementById('semester2-screen');
    if (btnSemester2 && screenSem2) {
        btnSemester2.addEventListener('click', function(e) {
            e.preventDefault();
            document.getElementById('semester-screen').classList.add('hidden');
            setTimeout(() => {
                screenSem2.classList.remove('hidden');
            }, 500);
        });
    }`;
content = content.replace(js_old, js_new);

// Add event listener for back button in semester 2
let back_js = `
        const btnBackSem2 = document.getElementById('btn-back-semester2');
        if (btnBackSem2 && screenSem2) {
            btnBackSem2.addEventListener('click', () => {
                screenSem2.classList.add('hidden');
                setTimeout(() => {
                    document.getElementById('semester-screen').classList.remove('hidden');
                }, 500);
            });
        }
`;
// Insert after semester1's back button
let sem1_back_js = `        if (btnBackSem1 && screenSem && screenSem1) {
            btnBackSem1.addEventListener('click', () => {
                screenSem1.classList.add('hidden');
                setTimeout(() => {
                    screenSem.classList.remove('hidden');
                }, 500);
            });
        }`;
content = content.replace(sem1_back_js, sem1_back_js + '\n' + back_js);

// Add event listener for Seminar PPG (btn-sem2-port1)
let seminar_js = `
        const btnSem2Port1 = document.getElementById('btn-sem2-port1');
        if (btnSem2Port1) {
            btnSem2Port1.addEventListener('click', () => {
                alert('Ruang Presentasi Seminar PPG sedang dalam tahap pengembangan.');
            });
        }
`;
content = content.replace(sem1_back_js, sem1_back_js + '\n' + seminar_js);

fs.writeFileSync('d:/Antigravity/E-Portofolio PPG/index.html', content, 'utf-8');
console.log("Done generating semester2-screen!");

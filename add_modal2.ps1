$html_to_append = @'
<!-- REFLEKSI MODAL -->
<div id="refleksi-modal" class="modal" style="z-index: 9999;">
    <div class="modal-content" style="max-width: 750px; width: 95%; text-align: left; background: #ffffff; border-radius: 16px; padding: 2.5rem; position: relative; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);">
        <button class="modal-close" onclick="closeRefleksiModal()" style="position: absolute; top: 1.5rem; right: 1.5rem; background: #f1f5f9; border: none; width: 36px; height: 36px; border-radius: 50%; cursor: pointer; display: flex; justify-content: center; align-items: center; color: #475569; transition: 0.3s;"><i class="ph-bold ph-x" style="font-size: 1.2rem;"></i></button>
        
        <div id="refleksi-modal-body">
            <!-- Content injected via JS -->
        </div>
    </div>
</div>

<script>
    function openRefleksiModal(title) {
        const modal = document.getElementById('refleksi-modal');
        const body = document.getElementById('refleksi-modal-body');
        
        body.innerHTML = `
            <h2 style="color: #1e3a8a; font-size: 1.7rem; font-weight: 800; margin-bottom: 0.3rem; font-family: var(--font-body); line-height: 1.3;">${title}</h2>
            <p style="color: #64748b; font-style: italic; font-size: 1rem; margin-bottom: 2rem;">Jurnal Refleksi Mata Kuliah</p>
            
            <div style="margin-bottom: 1.5rem; background: #f8fafc; padding: 1.25rem; border-radius: 8px;">
                <h4 style="color: #3b82f6; font-size: 1.1rem; font-weight: 700; margin-bottom: 0.75rem; border-left: 4px solid #3b82f6; padding-left: 0.75rem;">Konteks Pembuatan</h4>
                <p style="color: #334155; line-height: 1.7; font-size: 0.95rem; margin: 0;">Materi pembelajaran dan jurnal refleksi ini saya susun sebagai bagian dari pemenuhan tagihan mata kuliah <strong>${title}</strong>. Refleksi ini bertujuan untuk meninjau kembali proses belajar, mendokumentasikan praktik baik, serta mengidentifikasi strategi pemecahan masalah selama perkuliahan berlangsung.</p>
            </div>

            <div style="margin-bottom: 1.5rem; background: #f8fafc; padding: 1.25rem; border-radius: 8px;">
                <h4 style="color: #3b82f6; font-size: 1.1rem; font-weight: 700; margin-bottom: 0.75rem; border-left: 4px solid #3b82f6; padding-left: 0.75rem;">Tujuan</h4>
                <p style="color: #334155; line-height: 1.7; font-size: 0.95rem; margin: 0;">Tujuan dari refleksi ini adalah untuk memetakan capaian pembelajaran diri sendiri, mengevaluasi efektivitas metode yang diterapkan, serta merumuskan langkah tindak lanjut yang konstruktif guna meningkatkan kualitas pedagogik di masa depan.</p>
            </div>

            <div style="margin-bottom: 1.5rem; background: #f8fafc; padding: 1.25rem; border-radius: 8px;">
                <h4 style="color: #0ea5e9; font-size: 1.1rem; font-weight: 700; margin-bottom: 0.75rem; border-left: 4px solid #0ea5e9; padding-left: 0.75rem;">Kelebihan & Kekurangan</h4>
                <ul style="list-style: none; padding-left: 0; margin-top: 0.5rem; color: #334155; font-size: 0.95rem; margin-bottom: 0;">
                    <li style="margin-bottom: 0.75rem; display: flex; align-items: start;">
                        <i class="ph-fill ph-check-circle" style="color: #10b981; font-size: 1.2rem; margin-right: 10px; margin-top: 2px;"></i> 
                        <span style="line-height: 1.5;"><strong>Kelebihan:</strong> Berhasil menginternalisasi konsep esensial materi dan mampu mengaplikasikannya dalam rancangan pembelajaran yang adaptif terhadap kebutuhan peserta didik.</span>
                    </li>
                    <li style="display: flex; align-items: start;">
                        <i class="ph-fill ph-check-circle" style="color: #10b981; font-size: 1.2rem; margin-right: 10px; margin-top: 2px;"></i> 
                        <span style="line-height: 1.5;"><strong>Kekurangan:</strong> Masih memerlukan pendalaman literatur terkait implementasi strategi yang spesifik pada konteks lingkungan belajar yang sangat beragam.</span>
                    </li>
                </ul>
            </div>
        `;
        
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeRefleksiModal() {
        document.getElementById('refleksi-modal').classList.remove('active');
        document.body.style.overflow = '';
    }

    document.addEventListener('DOMContentLoaded', () => {
        const cards = document.querySelectorAll('.refleksi-card');
        cards.forEach(card => {
            const titleEl = card.querySelector('.refleksi-title');
            const btnRef = card.querySelector('.btn-ref-green');
            if(titleEl && btnRef) {
                btnRef.addEventListener('click', (e) => {
                    e.preventDefault();
                    openRefleksiModal(titleEl.innerText);
                });
            }
        });
        
        // Close modal on click outside
        const modal = document.getElementById('refleksi-modal');
        if (modal) {
            modal.addEventListener('click', (e) => {
                if(e.target === modal) closeRefleksiModal();
            });
        }
    });
</script>
</body>
'@

$files = @("d:\Antigravity\E-Portofolio PPG\index.html", "d:\Antigravity\E-Portofolio PPG\sem2_inject.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file)
    $content = $content -replace '</body>', $html_to_append
    [System.IO.File]::WriteAllText($file, $content)
}

Write-Host "Done"

$content = Get-Content -Raw -Path 'd:\Antigravity\E-Portofolio PPG\index.html'

$target = @"
        #semester-screen.hidden {
            opacity: 0;
                        </div>
                        <h4 style="font-size: 1.35rem; color: var(--text-main); margin-bottom: 1rem; font-weight: 800; z-index: 1;">Inspirasi Mengajar</h4>
"@

$replacement = @"
        #semester-screen.hidden {
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
        }
    </style>
    <div id="selection-screen" class="hidden">
        <div class="selection-header">
            <img src="logo.png" alt="Logo UST" class="selection-logo" onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Tut_Wuri_Handayani.svg/1024px-Tut_Wuri_Handayani.svg.png'">
            <h2 class="selection-title">Pilih E-Portfolio</h2>
            <p class="selection-subtitle">Silakan pilih e-portofolio yang ingin dibuka</p>
        </div>
        <div class="selection-cards" style="display: flex; gap: 2rem; max-width: 1000px; width: 90%; margin: 0 auto; justify-content: center; flex-wrap: wrap;">
            <!-- Card 1 -->
            <div class="selection-card" id="btn-portfolio1" style="background: rgba(30, 41, 59, 0.6); border: 1px solid rgba(6, 182, 212, 0.3); border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.5); position: relative; overflow: hidden; display: flex; flex-direction: column; transition: all 0.4s ease;">
                <div class="card-badge" style="background: rgba(6, 182, 212, 0.15); border: 1px solid rgba(6, 182, 212, 0.3); color: #06B6D4;">E-PORTOFOLIO 1</div>
                <div class="card-icon" style="background: rgba(6, 182, 212, 0.1); color: #06B6D4; width: 80px; height: 80px; display: flex; align-items: center; justify-content: center; border-radius: 20px; margin-bottom: 1.5rem;">
                    <i class="ph-fill ph-student" style="font-size: 3rem;"></i>
                </div>
                <h3 class="card-title" style="font-size: 1.5rem; color: #F8FAFC; margin-bottom: 0.5rem;">Portfolio Utama PPG</h3>
                <p class="card-desc" style="color: #94A3B8; font-size: 0.95rem; line-height: 1.6; margin-bottom: 2rem; flex-grow: 1;">Berisi profil lengkap, dokumentasi kegiatan, artefak pembelajaran, penilaian, video praktik, sertifikat, dan kontak.</p>
                <div class="card-action" style="color: #06B6D4; font-weight: 600; display: flex; align-items: center; gap: 0.5rem; transition: gap 0.3s ease;">
                    Buka E-Portofolio 1 <i class="ph ph-arrow-right"></i>
                </div>
            </div>
            <!-- Card 2 -->
            <div class="selection-card" id="btn-portfolio2" style="background: rgba(30, 41, 59, 0.6); border: 1px solid rgba(139, 92, 246, 0.3); border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.5); position: relative; overflow: hidden; display: flex; flex-direction: column; transition: all 0.4s ease;" onclick="document.body.classList.remove('splash-active');">
                <div class="card-badge" style="background: rgba(139, 92, 246, 0.15); border: 1px solid rgba(139, 92, 246, 0.3); color: #8B5CF6;">E-PORTOFOLIO 2</div>
                <div class="card-icon" style="background: rgba(139, 92, 246, 0.1); color: #8B5CF6; width: 80px; height: 80px; display: flex; align-items: center; justify-content: center; border-radius: 20px; margin-bottom: 1.5rem;">
                    <i class="ph-fill ph-rocket-launch" style="font-size: 3rem;"></i>
                </div>
                <h3 class="card-title" style="font-size: 1.5rem; color: #F8FAFC; margin-bottom: 0.5rem;">Refleksi PPL Terbimbing</h3>
                <p class="card-desc" style="color: #94A3B8; font-size: 0.95rem; line-height: 1.6; margin-bottom: 2rem; flex-grow: 1;">Berisi analisis pembelajaran, kendala & tantangan di lapangan, umpan balik konstruktif, serta inovasi pembelajaran digital.</p>
                <div class="card-action" style="color: #8B5CF6; font-weight: 600; display: flex; align-items: center; gap: 0.5rem; transition: gap 0.3s ease;">
                    Buka E-Portofolio 2 <i class="ph ph-arrow-right"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <style>
        /* ==================== MODERN NAVBAR ==================== */
        .navbar-modern {
            position: fixed;
            top: 1.5rem; left: 50%;
            transform: translateX(-50%);
            width: 95%;
            max-width: 1400px;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.08);
            padding: 0.6rem 1.2rem;
            transition: var(--transition-smooth);
        }

        body.dark-theme .navbar-modern {
            background: rgba(15, 23, 42, 0.95);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 25px rgba(0,0,0,0.4);
        }

        .nav-container-modern {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .logo-container-modern {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            text-decoration: none;
        }

        .logo-container-modern img {
            height: 42px;
            width: auto;
        }

        .logo-text {
            display: flex;
            flex-direction: column;
        }

        .logo-title {
            font-size: 0.95rem;
            font-weight: 700;
            color: #1E293B;
            line-height: 1.1;
        }
        body.dark-theme .logo-title { color: #F8FAFC; }

        .logo-subtitle {
            font-size: 0.75rem;
            color: #64748B;
        }
        body.dark-theme .logo-subtitle { color: #94A3B8; }

        .nav-links-modern {
            display: flex;
            gap: 1.8rem;
            align-items: center;
            list-style: none;
        }

        .nav-link-modern {
            font-size: 0.9rem;
            font-weight: 600;
            color: #475569;
            text-decoration: none;
            position: relative;
            padding: 0.5rem 0;
            transition: color 0.3s ease;
        }
        body.dark-theme .nav-link-modern { color: #94A3B8; }

        .nav-link-modern:hover, .nav-link-modern.active {
            color: #0284C7;
        }
        body.dark-theme .nav-link-modern:hover, body.dark-theme .nav-link-modern.active {
            color: #38BDF8;
        }

        .nav-link-modern.active::after {
            content: '';
            position: absolute;
            bottom: 0; left: 0; width: 100%; height: 2px;
            background-color: #0284C7;
            border-radius: 2px;
        }
        body.dark-theme .nav-link-modern.active::after { background-color: #38BDF8; }

        .nav-utilities-modern {
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .nav-util-btn-modern {
            width: 42px; height: 42px;
            border-radius: 12px;
            border: 1px solid rgba(0,0,0,0.05);
            background: #ffffff;
            color: #64748B;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            text-decoration: none;
        }
        body.dark-theme .nav-util-btn-modern {
            background: #1E293B;
            border-color: rgba(255,255,255,0.1);
            color: #94A3B8;
        }

        .nav-util-btn-modern:hover {
            color: #F59E0B;
            transform: translateY(-2px);
        }
        #back-to-selection.nav-util-btn-modern:hover {
            color: #0284C7;
        }
        body.dark-theme #back-to-selection.nav-util-btn-modern:hover {
            color: #38BDF8;
        }

        .profile-pill-modern {
            display: flex;
            align-items: center;
            gap: 0.6rem;
            background: #0284C7;
            color: white;
            padding: 0.35rem 1rem 0.35rem 0.35rem;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .profile-pill-modern:hover {
            background: #0369A1;
            box-shadow: 0 4px 12px rgba(2, 132, 199, 0.3);
        }
        .profile-pill-img {
            width: 34px; height: 34px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid rgba(255,255,255,0.8);
        }
        .profile-pill-name {
            font-size: 0.9rem;
            font-weight: 600;
        }

        /* ==================== MODERN HERO SECTION ==================== */
        .hero-modern {
            position: relative;
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding-top: 100px;
            overflow: hidden;
            border-bottom: none;
            background-color: #F8FAFC;
        }

        body.dark-theme .hero-modern {
            background-color: #0B1120;
        }

        .hero-bg-image {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background-image: url('homepage_bg.png');
            background-size: cover;
            background-position: center;
            z-index: 1;
        }
        
        .hero-bg-image::after {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(to right, rgba(255,255,255,0.95) 0%, rgba(255,255,255,0.6) 60%, transparent 100%);
            z-index: 2;
        }
        
        body.dark-theme .hero-bg-image::after {
            background: linear-gradient(to right, rgba(15,23,42,0.95) 0%, rgba(15,23,42,0.6) 60%, transparent 100%);
        }

        .hero-grid-modern {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            position: relative;
            z-index: 10;
        }

        .hero-text-modern {
            max-width: 650px;
            padding-left: 2rem;
        }

        .hero-badge-modern {
            display: inline-block;
            background: #84CC16;
            color: #1A2E05;
            font-weight: 800;
            padding: 0.3rem 1rem;
            border-radius: 4px;
            font-size: 1.1rem;
            margin-bottom: 1rem;
            letter-spacing: 1px;
            box-shadow: 0 4px 10px rgba(132, 204, 22, 0.3);
        }

        .hero-title-modern {
            font-family: 'Inter', sans-serif;
            font-size: clamp(3rem, 6vw, 6.5rem);
            font-weight: 900;
            line-height: 0.9;
            color: #0F172A;
            margin-bottom: 1.2rem;
            text-transform: uppercase;
            letter-spacing: -1px;
        }
        body.dark-theme .hero-title-modern { color: #F8FAFC; }

        .hero-subtitle-modern {
            font-size: 1.25rem;
            font-weight: 700;
            letter-spacing: 4px;
            color: #334155;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
        }
        body.dark-theme .hero-subtitle-modern { color: #94A3B8; }

        .hero-desc-modern {
            font-size: 1.1rem;
            color: #475569;
            line-height: 1.7;
            margin-bottom: 2.5rem;
            max-width: 550px;
        }
        body.dark-theme .hero-desc-modern { color: #94A3B8; }
        
        .hero-desc-modern strong {
            color: #0284C7;
        }
        body.dark-theme .hero-desc-modern strong { color: #38BDF8; }

        .hero-btns-modern {
            display: flex;
            gap: 1.2rem;
        }

        .btn-modern {
            padding: 0.8rem 2rem;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .btn-dark-modern {
            background: #0F172A;
            color: #FFFFFF;
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.2);
        }
        .btn-dark-modern:hover {
            background: #1E293B;
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(15, 23, 42, 0.3);
        }

        body.dark-theme .btn-dark-modern {
            background: #0284C7;
            box-shadow: 0 10px 20px rgba(2, 132, 199, 0.2);
        }
        body.dark-theme .btn-dark-modern:hover {
            background: #0369A1;
        }

        .btn-outline-modern {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            color: #0F172A;
            border: 1px solid #CBD5E1;
        }
        .btn-outline-modern:hover {
            background: #FFFFFF;
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border-color: #94A3B8;
        }

        body.dark-theme .btn-outline-modern {
            background: rgba(30, 41, 59, 0.6);
            color: #F8FAFC;
            border-color: #475569;
        }
        body.dark-theme .btn-outline-modern:hover {
            background: rgba(30, 41, 59, 0.9);
            border-color: #94A3B8;
        }

        .hero-visual-modern {
            position: relative;
            height: 85vh;
            display: flex;
            align-items: flex-end;
            justify-content: flex-end;
            margin-right: 0;
            padding-right: 2rem;
        }

        .profile-img-modern {
            height: 90%;
            object-fit: contain;
            filter: drop-shadow(-15px 15px 25px rgba(0,0,0,0.25));
            z-index: 3;
        }

        @media (max-width: 1024px) {
            .navbar-modern {
                padding: 0.5rem;
            }
            .nav-links-modern {
                display: none;
            }
            .hero-grid-modern {
                flex-direction: column;
                justify-content: center;
                text-align: center;
            }
            .hero-bg-image::after {
                background: rgba(255,255,255,0.85); 
            }
            body.dark-theme .hero-bg-image::after {
                background: rgba(15,23,42,0.9);
            }
            .hero-text-modern {
                margin-top: 4rem;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding-left: 0;
            }
            .hero-title-modern {
                font-size: 4rem;
            }
            .hero-visual-modern {
                height: 50vh;
                margin-top: 2rem;
                justify-content: center;
                padding-right: 0;
            }
            .profile-img-modern {
                height: 100%;
            }
        }
    </style>
    <nav id="navbar" class="navbar-modern">
        <div class="nav-container-modern">
            <a href="#hero" class="logo-container-modern">
                <img src="assets/ust-logo.png" alt="Logo UST" onerror="this.src='logo.png'">
                <div class="logo-text">
                    <span class="logo-title">PPG Prajabatan</span>
                    <span class="logo-subtitle">Universitas Sarjanawiyata Tamansiswa</span>
                </div>
            </a>
            
            <ul class="nav-links-modern">
                <li><a href="#hero" class="nav-link-modern active">Beranda</a></li>
                <li><a href="#profil" class="nav-link-modern">Identitas</a></li>
                <li><a href="#pendidikan" class="nav-link-modern">Refleksi</a></li>
                <li><a href="#artefak" class="nav-link-modern">Aktivitas LMS</a></li>
                <li><a href="#analisis" class="nav-link-modern">Inovasi & Seminar</a></li>
                <li><a href="#galeri" class="nav-link-modern">Galeri</a></li>
                <li><a href="#kontak" class="nav-link-modern">Kontak</a></li>
            </ul>

            <div class="nav-utilities-modern">
                <button id="theme-toggle" class="nav-util-btn-modern" title="Mode Terang/Gelap">
                    <i class="ph-fill ph-moon"></i>
                </button>
                <a href="#" id="back-to-selection" class="nav-util-btn-modern" title="Pilih Portofolio (Halaman 2)">
                    <i class="ph-fill ph-house"></i>
                </a>
                <div class="profile-pill-modern">
                    <img src="profile.png" alt="Hendra" class="profile-pill-img" onerror="this.src='profile2.jpg'">
                    <span class="profile-pill-name">Hendra</span>
                    <i class="ph-bold ph-caret-down"></i>
                </div>
            </div>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <header id="hero" class="hero-modern section">
        <div class="hero-bg-image"></div>
        <div class="container hero-grid-modern">
            <div class="hero-text-modern reveal">
                <div class="hero-badge-modern">PPG</div>
                <h1 class="hero-title-modern">HENDRA<br>MAHARDHIKA</h1>
                <h3 class="hero-subtitle-modern">PPG PRAJABATAN TEKNIK MESIN</h3>
                <p class="hero-desc-modern">
                    Berproses, belajar, dan berkembang untuk menjadi guru<br>
                    Teknik Mesin yang <strong>inspiratif, profesional, dan berdampak nyata.</strong>
                </p>
                <div class="hero-btns-modern">
                    <a href="#artefak" class="btn-modern btn-dark-modern">Jelajahi Refleksi <i class="ph ph-arrow-right"></i></a>
                    <a href="#inovasi" class="btn-modern btn-outline-modern">Lihat Inovasi</a>
                </div>
            </div>
            <div class="hero-visual-modern reveal">
                <img src="profile.png" alt="Foto Profil Hendra" class="profile-img-modern" onerror="this.src='profile2.jpg'">
            </div>
        </div>
    </header>

    <!-- PROFIL SECTION -->
    <section id="profil" class="section">
        <div class="container">
            <div class="section-title reveal" style="text-align: center; margin-bottom: 3.5rem;">
                <span style="display: block; font-size: 0.9rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 2px; margin-bottom: 0.5rem; font-family: var(--font-body);">About Me</span>
                <h2 style="font-size: 2.2rem; color: var(--primary-color); margin-bottom: 0.75rem;">Profil Mahasiswa</h2>
                <p style="font-size: 0.95rem; color: var(--text-muted); max-width: 650px; margin: 0 auto; line-height: 1.6;">
                    Mengenal lebih dekat perjalanan, inspirasi, dan visi saya dalam mendedikasikan diri sebagai guru profesional vokasi di bidang Teknik Pemesinan.
                </p>
            </div>
            
            <div class="reveal">
                <!-- 3 Cards Content -->
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 2rem; margin-bottom: 3.5rem;">
                    
                    <!-- Card 1 -->
                    <div class="card" style="padding: 2.5rem 2rem; border-radius: 24px; transition: all 0.4s ease; display: flex; flex-direction: column; height: 100%; border-top: 4px solid var(--primary-color); position: relative; overflow: hidden;" onmouseover="this.style.transform='translateY(-10px)'; this.style.boxShadow='0 20px 40px rgba(0,0,0,0.12)';" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='var(--shadow-sm)';">
                        <div style="position: absolute; top: -20px; right: -20px; font-size: 10rem; opacity: 0.03; color: var(--text-main); pointer-events: none;">
                            <i class="ph-fill ph-map-pin"></i>
                        </div>
                        <div style="width: 60px; height: 60px; background: var(--primary-light); color: var(--primary-color); border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 2rem; margin-bottom: 1.5rem; z-index: 1;">
                            <i class="ph-fill ph-map-pin"></i>
                        </div>
                        <h4 style="font-size: 1.35rem; color: var(--text-main); margin-bottom: 1rem; font-weight: 800; z-index: 1;">Asal & Latar Belakang</h4>
                        <p style="color: var(--text-muted); font-size: 0.95rem; line-height: 1.7; margin: 0; text-align: justify; flex-grow: 1; z-index: 1;">
                            Saya berasal dari <strong>Daerah Istimewa Yogyakarta</strong>, wilayah yang kaya budaya dan menjunjung tinggi nilai pendidikan. Suasana Kota Pelajar ini membentuk karakter saya menjadi pribadi disiplin yang haus akan ilmu pengetahuan. Ketertarikan mendalam pada teknologi mendorong saya mendalami <strong>Teknik Pemesinan</strong> untuk berkontribusi secara nyata.
                        </p>
                    </div>

                    <!-- Card 2 -->
                    <div class="card" style="padding: 2.5rem 2rem; border-radius: 24px; transition: all 0.4s ease; display: flex; flex-direction: column; height: 100%; border-top: 4px solid #10b981; position: relative; overflow: hidden;" onmouseover="this.style.transform='translateY(-10px)'; this.style.boxShadow='0 20px 40px rgba(0,0,0,0.12)';" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='var(--shadow-sm)';">
                        <div style="position: absolute; top: -20px; right: -20px; font-size: 10rem; opacity: 0.03; color: var(--text-main); pointer-events: none;">
                            <i class="ph-fill ph-lightbulb"></i>
                        </div>
                        <div style="width: 60px; height: 60px; background: rgba(16, 185, 129, 0.1); color: #10b981; border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 2rem; margin-bottom: 1.5rem; z-index: 1;">
                            <i class="ph-fill ph-lightbulb"></i>
                        </div>
                        <h4 style="font-size: 1.35rem; color: var(--text-main); margin-bottom: 1rem; font-weight: 800; z-index: 1;">Inspirasi Mengajar</h4>
"@

$content = $content.Replace($target, $replacement)
Set-Content -Path 'd:\Antigravity\E-Portofolio PPG\index.html' -Value $content -Encoding UTF8

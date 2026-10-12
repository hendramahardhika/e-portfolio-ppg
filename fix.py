import sys

# The exact big string to insert
REPLACEMENT_TEXT = """            background: #3b82f6;
            color: white;
            box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
            transform: translateY(-2px);
        }
        @keyframes textGlow {
            0% { filter: drop-shadow(0 0 10px rgba(96, 165, 250, 0.2)); }
            100% { filter: drop-shadow(0 0 20px rgba(192, 132, 252, 0.6)); }
        }
        @keyframes spin {
            100% { transform: rotate(360deg); }
        }
        @keyframes spin-reverse {
            100% { transform: rotate(-360deg); }
        }
        /* Disable scroll on body when splash is active */
        body.splash-active {
            overflow: hidden !important;
            height: 100vh !important;
        }

        /* ==================== SELECTION SCREEN ==================== */
        #selection-screen {
            position: fixed;
            inset: 0;
            background-color: var(--bg-main); /* Futuristic deep blue */
            z-index: 9998;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--text-main);
            font-family: var(--font-body);
            transition: opacity 0.5s ease, visibility 0.5s ease;
        }
        #selection-screen::before {
            content: '';
            position: absolute;
            top: 50%; left: 50%;
            width: 60vw; height: 60vw;
            background: radial-gradient(circle, rgba(6, 182, 212, 0.05) 0%, transparent 60%);
            transform: translate(-50%, -50%);
            pointer-events: none;
            z-index: -1;
        }
        #selection-screen.hidden {
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
        }
        .selection-header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInUp 0.8s ease forwards;
        }
        .selection-logo {
            height: 100px;
            margin-bottom: 1rem;
            filter: drop-shadow(0 0 10px rgba(255,255,255,0.2));
        }
        .selection-title {
            font-size: clamp(2rem, 4vw, 2.5rem);
            font-weight: 800;
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, #fff 0%, #06b6d4 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .selection-subtitle {
            color: var(--text-muted);
            font-size: 1.1rem;
        }
        .selection-cards {
            display: flex;
            gap: 2rem;
            max-width: 1000px;
            width: 90%;
            padding: 1rem;
        }
        .selection-card {
            flex: 1;
            background-color: var(--bg-card);
            backdrop-filter: var(--glass-blur);
            -webkit-backdrop-filter: var(--glass-blur);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 2.5rem 2rem;
            text-align: left;
            cursor: pointer;
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            animation: fadeInUp 0.8s ease forwards;
            animation-delay: 0.2s;
            opacity: 0;
        }
        .selection-card:nth-child(2) {
            animation-delay: 0.4s;
        }
        .selection-card:hover {
            transform: translateY(-10px);
            border-color: var(--primary-color);
            box-shadow: var(--shadow-glow);
        }
        .card-badge {
            position: absolute;
            top: 2rem;
            right: 2rem;
            background-color: rgba(6, 182, 212, 0.1);
            border: 1px solid rgba(6, 182, 212, 0.3);
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 700;
            color: var(--primary-color);
            letter-spacing: 1px;
        }
        .card-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            margin-top: 1rem;
            filter: drop-shadow(0 0 8px rgba(6, 182, 212, 0.5));
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--text-main);
        }
        .card-desc {
            color: var(--text-muted);
            line-height: 1.6;
            margin-bottom: 2rem;
            flex-grow: 1;
        }
        .card-action {
            display: inline-flex;
            align-items: center;
            background-color: transparent;
            color: var(--primary-color);
            font-weight: 600;
            transition: all 0.3s ease;
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            align-self: flex-start;
        }
        .selection-card:hover .card-action {
            background-color: var(--primary-color);
            color: #0B1120;
            gap: 0.5rem;
            box-shadow: 0 0 10px rgba(6, 182, 212, 0.8);
        }
        @media (max-width: 768px) {
            .selection-cards {
                flex-direction: column;
            }
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .fade-in-up {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }
        .fade-in-up.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
    <style>
        .css-robot-container {
            width: 250px;
            height: 250px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: float 3s ease-in-out infinite;
        }

        .css-robot-head {
            width: 120px;
            height: 90px;
            background: linear-gradient(145deg, #1e3a8a, #0f172a);
            border-radius: 45px 45px 30px 30px;
            position: absolute;
            top: 20px;
            box-shadow: inset 0 5px 15px rgba(255,255,255,0.2), 0 10px 20px rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2;
        }

        .css-robot-face {
            width: 90px;
            height: 50px;
            background: #020617;
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            box-shadow: inset 0 0 15px rgba(6, 182, 212, 0.4);
            position: relative;
        }

        .css-robot-eyes {
            display: flex;
            gap: 15px;
            margin-bottom: 5px;
        }

        .css-robot-eye {
            width: 16px;
            height: 8px;
            border: 3px solid #06b6d4;
            border-bottom: none;
            border-radius: 16px 16px 0 0;
            box-shadow: 0 -2px 10px #06b6d4;
            animation: blink 4s infinite;
        }

        .css-robot-smile {
            width: 24px;
            height: 10px;
            border: 3px solid #06b6d4;
            border-top: none;
            border-radius: 0 0 24px 24px;
            box-shadow: 0 2px 10px #06b6d4;
        }

        .css-robot-ear {
            width: 15px;
            height: 30px;
            background: #1e40af;
            position: absolute;
            top: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(6, 182, 212, 0.5);
        }
        .css-robot-ear.left { left: -10px; }
        .css-robot-ear.right { right: -10px; }

        .css-robot-body {
            width: 90px;
            height: 80px;
            background: linear-gradient(145deg, #1e3a8a, #0f172a);
            border-radius: 20px 20px 30px 30px;
            position: absolute;
            top: 120px;
            box-shadow: inset 0 5px 15px rgba(255,255,255,0.2), 0 10px 20px rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1;
        }

        .css-robot-chest-ring {
            width: 30px;
            height: 30px;
            border: 4px solid #06b6d4;
            border-radius: 50%;
            box-shadow: 0 0 15px #06b6d4, inset 0 0 10px #06b6d4;
        }
        
        .robot-svg-container {
            width: 300px;
            height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes floatBody {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        @keyframes shadowPulse {
            0%, 100% { transform: scale(1); opacity: 0.4; }
            50% { transform: scale(0.8); opacity: 0.2; }
        }

        @keyframes armWave {
            0% { transform: rotate(-10deg); }
            100% { transform: rotate(-110deg); }
        }

        @keyframes eyeBlink {
            0%, 95%, 100% { transform: scaleY(1); stroke-width: 5; }
            97% { transform: scaleY(0.1); stroke-width: 10; }
        }

        .robot-shadow {
            animation: shadowPulse 4s ease-in-out infinite;
            transform-origin: center;
        }

        .robot-arm-wave {
            transform-origin: 0px 0px;
            animation: armWave 1.2s ease-in-out infinite alternate;
        }

        .eye-blink {
            transform-origin: center 8px;
            animation: eyeBlink 5s infinite;
        }
        .hud-container {
            position: relative;
            z-index: 10;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
        }
        /* HUD Corners */
        .hud-corner {
            position: absolute;
            width: 150px;
            height: 150px;
            border: 2px solid rgba(136, 196, 255, 0.4);
            z-index: 5;
        }
        .hud-corner.top-left { top: 20px; left: 20px; border-top: 3px solid #1e90ff; border-left: 3px solid #1e90ff; border-radius: 10px 0 0 0; box-shadow: inset 2px 2px 5px rgba(30, 144, 255, 0.3), -2px -2px 5px rgba(30, 144, 255, 0.3); }
        .hud-corner.top-right { top: 20px; right: 20px; border-top: 3px solid #1e90ff; border-right: 3px solid #1e90ff; border-radius: 0 10px 0 0; box-shadow: inset -2px 2px 5px rgba(30, 144, 255, 0.3), 2px -2px 5px rgba(30, 144, 255, 0.3); }
        .hud-corner.bottom-left { bottom: 20px; left: 20px; border-bottom: 3px solid #1e90ff; border-left: 3px solid #1e90ff; border-radius: 0 0 0 10px; box-shadow: inset 2px -2px 5px rgba(30, 144, 255, 0.3), -2px 2px 5px rgba(30, 144, 255, 0.3); }
        .hud-corner.bottom-right { bottom: 20px; right: 20px; border-bottom: 3px solid #1e90ff; border-right: 3px solid #1e90ff; border-radius: 0 0 10px 0; box-shadow: inset -2px -2px 5px rgba(30, 144, 255, 0.3), 2px 2px 5px rgba(30, 144, 255, 0.3); }

        .hud-corner::before { content: ''; position: absolute; background: #fff; box-shadow: 0 0 10px #1e90ff; }
        .hud-corner::after { content: ''; position: absolute; background: #fff; box-shadow: 0 0 10px #1e90ff; }
        
        .hud-corner.top-left::before { top: 8px; left: -3px; width: 3px; height: 30px; }
        .hud-corner.top-left::after { top: -3px; left: 8px; width: 30px; height: 3px; }
        .hud-corner.top-right::before { top: 8px; right: -3px; width: 3px; height: 30px; }
        .hud-corner.top-right::after { top: -3px; right: 8px; width: 30px; height: 3px; }
        .hud-corner.bottom-left::before { bottom: 8px; left: -3px; width: 3px; height: 30px; }
        .hud-corner.bottom-left::after { bottom: -3px; left: 8px; width: 30px; height: 3px; }
        .hud-corner.bottom-right::before { bottom: 8px; right: -3px; width: 3px; height: 30px; }
        .hud-corner.bottom-right::after { bottom: -3px; right: 8px; width: 30px; height: 3px; }

        .hud-bottom-elements { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 100%; display: flex; flex-direction: column; align-items: center; z-index: 20;}
        
        .hud-divider {
            width: 450px; height: 3px;
            background: #1e90ff;
            box-shadow: 0 0 10px #1e90ff, 0 -8px 0 rgba(30, 144, 255, 0.5); /* Double line effect */
            margin-bottom: 1.5rem;
            border-radius: 2px;
        }

        .hud-messages { text-align: center; margin-bottom: 1.5rem; }
        .hud-msg-main { 
            font-size: 1.2rem; letter-spacing: 3px; font-weight: 700; color: #031526; 
            margin-bottom: 0.5rem; text-transform: uppercase; 
            background: rgba(255, 255, 255, 0.9);
            padding: 5px 25px;
            border-radius: 5px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.8);
        }
        .hud-msg-sub { 
            font-size: 0.95rem; color: #031526; letter-spacing: 1px; 
            background: rgba(255, 255, 255, 0.85); 
            padding: 3px 15px; border-radius: 5px;
            display: inline-block;
        }

        .splash-btn {
            background: linear-gradient(to bottom, #0a3d6d, #031526);
            border: 3px solid #1e90ff;
            color: #ffffff;
            padding: 0.6rem 2.5rem 0.6rem 0.6rem;
            border-radius: 50px;
            display: flex;
            align-items: center;
            gap: 1.5rem;
            transition: all 0.3s ease;
            opacity: 0.5; /* Disabled state initially */
            cursor: not-allowed;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.6), 0 0 15px rgba(30, 144, 255, 0.5), inset 0 0 15px rgba(30, 144, 255, 0.5);
            font-weight: 600;
            letter-spacing: 2px;
        }
        .splash-btn .arrow-up-icon {
            background: #1e90ff;
            color: #ffffff;
            width: 40px; height: 40px;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.2rem;
            box-shadow: 0 0 10px #1e90ff, inset 0 0 10px rgba(255,255,255,0.8);
        }
        .splash-btn.ready {
            opacity: 1;
            cursor: pointer;
        }
        .splash-btn.ready:hover {
            background: linear-gradient(to bottom, #031526, #0a3d6d);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.8), 0 0 25px rgba(30, 144, 255, 0.7), inset 0 0 25px rgba(30, 144, 255, 0.7);
        }
    </style>
</head>
<body class="splash-active">

    <!-- Splash Screen -->
    <div id="splash-screen">
        <div class="hud-container">
            <!-- HUD Corners -->
            <div class="hud-corner top-left"></div>
            <div class="hud-corner top-right"></div>
            <div class="hud-corner bottom-left"></div>
            <div class="hud-corner bottom-right"></div>

            <!-- Central Elements (Centered now) -->
            <div class="hud-bottom-elements">
                <div class="hud-center-circle" style="position: relative; width: 250px; height: 250px; display: flex; align-items: center; justify-content: center; margin-bottom: 2.5rem;">
                    <div class="hud-circle-outer"></div>
                    <div class="hud-circle-middle"></div>
                    <div class="hud-circle-inner"></div>
                    <div class="hud-text-center">
                        <div class="hud-status" id="hud-status">INITIALIZING</div>
                        <div class="hud-percentage"><span id="hud-percentage-text">0</span>%</div>
                    </div>
                </div>

                <!-- Glowing Divider -->
                <div class="hud-divider"></div>

                <!-- Messages -->
                <div class="hud-messages">
                    <div class="hud-msg-main" id="hud-msg-main">SEMUA TAMPILAN SIAP</div>
                    <div class="hud-msg-sub" id="hud-msg-sub">Geser ke atas untuk masuk tanpa jeda.</div>
                </div>

                <!-- Enter Button -->
                <button class="splash-btn" id="enter-btn">
                    <div class="arrow-up-icon">
                        <i class="ph-bold ph-arrow-up"></i>
                    </div>
                    <span>SWIPE UNTUK MASUK</span>
                </button>
            </div>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const splash = document.getElementById('splash-screen');
            const percentText = document.getElementById('hud-percentage-text');
            const msgMain = document.getElementById('hud-msg-main');
            const msgSub = document.getElementById('hud-msg-sub');
            const statusText = document.getElementById('hud-status');
            const enterBtn = document.getElementById('enter-btn');
            
            let isHidden = false;
            let isReady = false;

            // Set initial state
            if (msgMain) msgMain.innerText = "SISTEM MEMUAT...";
            if (msgSub) msgSub.innerText = "Harap tunggu hingga proses selesai.";
            if (enterBtn) {
                enterBtn.style.opacity = '0.5';
                enterBtn.style.cursor = 'not-allowed';
            }

            // Loading Animation Simulation
            let loadPercent = 0;
            let loadInterval = setInterval(() => {
                loadPercent += Math.floor(Math.random() * 4) + 1; // Increment by 1-4%
                if (loadPercent >= 100) {
                    loadPercent = 100;
                    clearInterval(loadInterval);
                    
                    isReady = true;
                    if (percentText) percentText.innerText = loadPercent;
                    if (statusText) statusText.innerText = "SYSTEM READY";
                    if (msgMain) msgMain.innerText = "SEMUA TAMPILAN SIAP";
                    if (msgSub) msgSub.innerText = "Geser ke atas, klik, atau tekan enter untuk masuk.";
                    
                    if (enterBtn) {
                        enterBtn.classList.add('ready');
                        enterBtn.style.opacity = '1';
                        enterBtn.style.cursor = 'pointer';
                    }
                } else {
                    if (percentText) percentText.innerText = loadPercent;
                    if (statusText) {
                        if (loadPercent > 30 && loadPercent < 70) {
                            statusText.innerText = "LOADING ASSETS";
                        } else if (loadPercent >= 70) {
                            statusText.innerText = "FINALIZING";
                        }
                    }
                }
            }, 60);

            function hideSplash() {
                if (!isReady || isHidden) return;
                isHidden = true;
                splash.classList.add('hidden');
                setTimeout(() => {
                    document.body.classList.remove('splash-active');
                }, 800);
            }

            // Click anywhere on splash
            splash.addEventListener('click', hideSplash);
            
            // Explicitly the button
            if (enterBtn) enterBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                hideSplash();
            });

            // Swipe Up (Mouse Wheel)
            splash.addEventListener('wheel', (e) => {
                if (e.deltaY > 0) {
"""

with open("d:\\Antigravity\\E-Portofolio PPG\\index.html", "r", encoding="utf-8") as f:
    content = f.read()

target = """.splash-btn:hover {
                    hideSplash();
                }
            });"""

if target in content:
    new_content = content.replace(target, ".splash-btn:hover {\n" + REPLACEMENT_TEXT + "                    hideSplash();\n                }\n            });")
    with open("d:\\Antigravity\\E-Portofolio PPG\\index.html", "w", encoding="utf-8") as f:
        f.write(new_content)
    print("Fixed successfully!")
else:
    print("Target not found.")

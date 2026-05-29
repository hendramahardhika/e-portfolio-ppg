const fs = require('fs');

try {
    let indexHtml = fs.readFileSync('index.html', 'utf-8');
    let port2Html = fs.readFileSync('portfolio2.html', 'utf-8');

    // Extract styles
    let styleMatch = port2Html.match(/<style>([\s\S]*?)<\/style>/);
    let css = styleMatch ? styleMatch[1] : '';

    // Scope the CSS
    // Replace :root with #portfolio-content-2
    css = css.replace(/:root/g, '#portfolio-content-2');
    
    // Replace body { with #portfolio-content-2 {
    css = css.replace(/(^|\}|;)\s*body\s*\{/g, '$1\n#portfolio-content-2 {');
    
    // Prefix other selectors. 
    // This is a naive CSS parser. It splits by '}'
    let scopedCss = '';
    let blocks = css.split('}');
    for (let i = 0; i < blocks.length; i++) {
        let block = blocks[i].trim();
        if (!block) continue;
        
        let parts = block.split('{');
        if (parts.length === 2) {
            let selectors = parts[0].trim();
            let rules = parts[1];
            
            // Handle @media queries
            if (selectors.startsWith('@media')) {
                // Not scoping the @media itself, we need to scope inside it.
                // For simplicity, since the file only has one @media at the end, let's just let it be.
                // Wait, it's easier to just use standard nesting for the rest.
                scopedCss += selectors + ' { ' + rules + ' }\n';
            } else if (selectors === '#portfolio-content-2') {
                scopedCss += selectors + ' { ' + rules + ' }\n';
            } else {
                // Split comma separated selectors
                let splitSelectors = selectors.split(',').map(s => {
                    let sel = s.trim();
                    if (sel.startsWith('@') || sel.startsWith('to ') || sel.startsWith('from ') || sel.includes('%')) {
                        // Keyframes
                        return sel;
                    }
                    if (sel === '*') return '#portfolio-content-2 *';
                    return '#portfolio-content-2 ' + sel;
                }).join(', ');
                scopedCss += splitSelectors + ' { ' + rules + ' }\n';
            }
        } else {
            // Might be nested or keyframes, just append
            scopedCss += block + '}\n';
        }
    }

    // Extract HTML body (excluding scripts and styles)
    // Find body content
    let bodyMatch = port2Html.match(/<body>([\s\S]*?)<\/body>/);
    let bodyContent = bodyMatch ? bodyMatch[1] : '';

    // Remove script tags from body content to put them at the end
    let scriptRegex = /<script>([\s\S]*?)<\/script>/g;
    let scripts = [];
    let match;
    while ((match = scriptRegex.exec(bodyContent)) !== null) {
        scripts.push(match[1]);
    }
    bodyContent = bodyContent.replace(scriptRegex, '');

    // Now we need to create the final #portfolio-content-2 div
    let finalHtmlPort2 = `
    <!-- ========================================== -->
    <!--          E-PORTOFOLIO 2 START              -->
    <!-- ========================================== -->
    <div id="portfolio-content-2" class="hidden" style="width: 100%; min-height: 100vh; overflow-x: hidden;">
        <style>
        ${scopedCss}
        </style>

        <!-- Tambahkan Tombol Kembali ke Menu Utama -->
        <div style="position: fixed; top: 20px; left: 20px; z-index: 9999;">
            <a href="#" id="back-to-selection-2" class="nav-util-btn" style="background: rgba(15, 23, 42, 0.8); backdrop-filter: blur(8px); color: #38BDF8; text-decoration: none; padding: 0.5rem 1rem; border-radius: 8px; border: 1px solid #38BDF8; font-weight: bold; display: flex; align-items: center; gap: 0.5rem; transition: all 0.3s ease;">
                <i class="ph ph-arrow-left"></i> Kembali ke Menu
            </a>
        </div>

        ${bodyContent}
    </div>
    <!-- ========================================== -->
    <!--           E-PORTOFOLIO 2 END               -->
    <!-- ========================================== -->
    `;

    // Inject into index.html
    // We want to place it right after <div id="portfolio-content" class="hidden"> ... </div>
    // Let's find a good injection point. Before <script> tags at the bottom.
    // In index.html, the scripts start at: <script> ... init()
    let injectionPoint = indexHtml.lastIndexOf('<script>');
    if (injectionPoint === -1) injectionPoint = indexHtml.indexOf('</body>');

    let newIndexHtml = indexHtml.substring(0, injectionPoint) + finalHtmlPort2 + '\n' + indexHtml.substring(injectionPoint);

    // Also we need to inject the scripts from Port2.
    let combinedScripts = `
    <script>
    // --- Scripts from Portfolio 2 ---
    ${scripts.join('\n')}

    // --- Navigation Logic for Portfolio 2 ---
    document.addEventListener('DOMContentLoaded', () => {
        // Handle "Buka E-Portofolio 2" button in selection screen
        const openPort2Btns = document.querySelectorAll('.selection-card');
        openPort2Btns.forEach(btn => {
            if(btn.getAttribute('href') === 'portfolio2.html') {
                btn.addEventListener('click', function(e) {
                    e.preventDefault();
                    document.getElementById('selection-screen').classList.add('hidden');
                    document.getElementById('portfolio-content-2').classList.remove('hidden');
                    window.scrollTo(0,0);
                });
            }
        });

        // Handle Back Button in Portfolio 2
        const backBtn2 = document.getElementById('back-to-selection-2');
        if(backBtn2) {
            backBtn2.addEventListener('click', function(e) {
                e.preventDefault();
                document.getElementById('portfolio-content-2').classList.add('hidden');
                document.getElementById('selection-screen').classList.remove('hidden');
                window.scrollTo(0,0);
            });
        }
    });
    </script>
    `;

    // Add scripts just before </body>
    newIndexHtml = newIndexHtml.replace('</body>', combinedScripts + '\n</body>');

    // Update the link in selection screen to prevent default
    newIndexHtml = newIndexHtml.replace(/href="portfolio2.html"/g, 'href="#" data-target="portfolio2"');

    // Write back
    fs.writeFileSync('index_merged.html', newIndexHtml);
    console.log("Merge completed successfully to index_merged.html");

} catch (e) {
    console.error("Error during merge:", e);
}

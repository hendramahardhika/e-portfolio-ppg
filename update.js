const fs = require('fs');

const htmlPath = 'd:/Antigravity/index.html';
let html = fs.readFileSync(htmlPath, 'utf8');

const getSubtitle = (title) => {
    let lower = title.toLowerCase();
    if (lower.includes('rpp')) return 'Rencana Pelaksanaan Pembelajaran (RPP)';
    if (lower.includes('materi') || lower.includes('bahan ajar')) return 'Materi Pembelajaran';
    if (lower.includes('lkm') || lower.includes('lembar kerja')) return 'Lembar Kerja Peserta Didik (LKPD)';
    if (lower.includes('media')) return 'Media Pembelajaran';
    if (lower.includes('asesmen')) return 'Instrumen Asesmen';
    return 'Dokumen Pembelajaran';
};

const getTemplate = (title, subtitle, link) => {
    // Escape backticks in strings
    const safeTitle = title.replace(/\`/g, "\\`");
    const safeLink = link ? link.replace('/view?usp=sharing', '/preview') : '';
    
    return `
                        <div class="custom-modal-layout" style="text-align: left; padding-top: 0.5rem;">
                            <h2 style="color: var(--primary-color); font-size: 1.6rem; font-weight: 800; margin-bottom: 0.2rem; font-family: var(--font-body);">${safeTitle}</h2>
                            <p style="color: var(--text-muted); font-style: italic; font-size: 0.95rem; margin-bottom: 1.5rem;">${subtitle}</p>
                            
                            <hr style="border: none; border-top: 1px solid var(--border-color); margin-bottom: 1.5rem;">

                            <div style="margin-bottom: 1.5rem;">
                                <h4 style="color: #0ea5e9; font-size: 1.1rem; font-weight: 700; border-left: 3px solid #0ea5e9; padding-left: 0.75rem; margin-bottom: 0.75rem;">Konteks Pembuatan</h4>
                                <p style="color: var(--text-main); opacity: 0.85; font-size: 0.95rem; line-height: 1.7; text-align: justify;">................................................................................................</p>
                            </div>

                            <div style="margin-bottom: 1.5rem;">
                                <h4 style="color: #0ea5e9; font-size: 1.1rem; font-weight: 700; border-left: 3px solid #0ea5e9; padding-left: 0.75rem; margin-bottom: 0.75rem;">Tujuan</h4>
                                <p style="color: var(--text-main); opacity: 0.85; font-size: 0.95rem; line-height: 1.7; text-align: justify;">................................................................................................</p>
                            </div>

                            <div style="margin-bottom: 1.5rem;">
                                <h4 style="color: #0ea5e9; font-size: 1.1rem; font-weight: 700; border-left: 3px solid #0ea5e9; padding-left: 0.75rem; margin-bottom: 1rem;">Kelebihan & Kekurangan</h4>
                                
                                <h5 style="color: #10b981; font-size: 0.95rem; font-weight: 700; margin-bottom: 0.5rem; display: flex; align-items: center; gap: 0.35rem;">
                                    <span>✓</span> Kelebihan
                                </h5>
                                <ul style="list-style: none; padding-left: 0; color: var(--text-main); opacity: 0.85; font-size: 0.95rem; line-height: 1.7; margin-bottom: 1rem; text-align: justify;">
                                    <li style="margin-bottom: 0.5rem; display: flex; gap: 0.5rem;"><span style="color: #10b981;">✓</span> <span>...................................................</span></li>
                                </ul>

                                <h5 style="color: #ef4444; font-size: 0.95rem; font-weight: 700; margin-bottom: 0.5rem; display: flex; align-items: center; gap: 0.35rem;">
                                    <span>⚠</span> Kekurangan
                                </h5>
                                <ul style="list-style: none; padding-left: 0; color: var(--text-main); opacity: 0.85; font-size: 0.95rem; line-height: 1.7; text-align: justify;">
                                    <li style="margin-bottom: 0.5rem; display: flex; gap: 0.5rem;"><span style="color: #ef4444;">⚠</span> <span>...................................................</span></li>
                                </ul>
                            </div>

                            <div style="margin-bottom: 2rem;">
                                <h4 style="color: #0ea5e9; font-size: 1.1rem; font-weight: 700; border-left: 3px solid #0ea5e9; padding-left: 0.75rem; margin-bottom: 0.75rem;">Kajian Teori</h4>
                                <p style="color: var(--text-muted); font-size: 0.95rem; line-height: 1.7; font-style: italic; padding-left: 1rem; border-left: 2px solid var(--border-color); text-align: justify;">................................................................................................</p>
                            </div>

                            <hr style="border: none; border-top: 1px dashed #cbd5e1; margin-bottom: 1.5rem;">

                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                                <h4 style="color: #0f172a; font-size: 1.05rem; font-weight: 700; margin: 0;">Preview Dokumen Full</h4>
                                <a href="${link}" target="_blank" style="background: #f1f5f9; color: #0ea5e9; padding: 0.5rem 1rem; border-radius: 6px; font-size: 0.85rem; font-weight: 600; text-decoration: none; display: inline-flex; align-items: center; gap: 0.25rem; transition: background 0.2s;">Buka di Tab Baru ↗</a>
                            </div>

                            <div style="border-radius: 8px; overflow: hidden; border: 1px solid #1e293b; background: #0f172a; padding: 1rem;">
                                <iframe src="${safeLink}" style="width: 100%; height: 500px; border: none; background: white; border-radius: 4px;"></iframe>
                            </div>
                        </div>
                    `;
};

// Find the portfolioData block
const startMarker = 'const portfolioData = {';
const endMarker = '};';

let startIndex = html.indexOf(startMarker);
if (startIndex === -1) {
    console.error('Could not find portfolioData');
    process.exit(1);
}

// Find the corresponding closing brace for portfolioData
// We'll search manually counting braces.
let openBraces = 0;
let endIndex = -1;
for (let i = startIndex + startMarker.length - 1; i < html.length; i++) {
    if (html[i] === '{') openBraces++;
    else if (html[i] === '}') {
        openBraces--;
        if (openBraces === 0) {
            endIndex = i + 1;
            break;
        }
    }
}

if (endIndex === -1) {
    console.error('Could not parse portfolioData bounds');
    process.exit(1);
}

// We have the block, let's extract it.
let portfolioBlock = html.substring(startIndex, endIndex);

// Using Regex to replace customHtml or insert it if missing.
// This requires parsing the JS object. A simple regex replacement on string is risky.
// Better to evaluate it to a real JS object, modify it, and then stringify it.
// However, the object has variables and functions? No, it's just a data object with strings.

let dataStr = html.substring(startIndex + 'const portfolioData = '.length, endIndex);

// We need to parse this string into a JS object.
// Because it's purely JS syntax, not strict JSON (keys aren't always quoted, backticks used), we can eval it.
let portfolioObj;
try {
    portfolioObj = eval('(' + dataStr + ')');
} catch (e) {
    console.error('Failed to eval portfolioData:', e);
    process.exit(1);
}

// Modify the object
for (let key in portfolioObj) {
    // Keep "1" exactly as it is since it's the example
    if (key === "1") continue;

    let item = portfolioObj[key];
    let subtitle = getSubtitle(item.title);
    let link = item.link || '';
    
    // Some items might not have a link, like item 6
    if (!link) {
        // If there's no link, we can still generate the template but omit the preview part
        item.customHtml = getTemplate(item.title, subtitle, '#').replace(/<hr style="border: none; border-top: 1px dashed #cbd5e1; margin-bottom: 1.5rem;">[\s\S]*/, '</div>');
    } else {
        item.customHtml = getTemplate(item.title, subtitle, link);
    }
}

// Now we need to convert the object back to a JS string.
// We can format it manually so it looks clean.
let newBlock = 'const portfolioData = {\n';
for (let key in portfolioObj) {
    let item = portfolioObj[key];
    newBlock += `                "${key}": {\n`;
    newBlock += `                    title: ${JSON.stringify(item.title)},\n`;
    newBlock += `                    img: ${JSON.stringify(item.img)},\n`;
    newBlock += `                    desc: ${JSON.stringify(item.desc)},\n`;
    if (item.link) {
        newBlock += `                    link: ${JSON.stringify(item.link)},\n`;
    }
    if (item.customHtml) {
        newBlock += `                    customHtml: \`${item.customHtml}\`\n`;
    }
    newBlock += `                },\n`;
}
// Remove trailing comma
newBlock = newBlock.slice(0, -2) + '\n            };';

// Replace the block in the original html
let finalHtml = html.substring(0, startIndex) + newBlock + html.substring(endIndex + 1); // +1 for the semicolon if any

fs.writeFileSync(htmlPath, finalHtml, 'utf8');
console.log('Successfully updated portfolioData with templates.');

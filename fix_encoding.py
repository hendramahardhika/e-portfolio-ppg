import os

filepath = r"d:\Antigravity\E-Portofolio PPG\index.html"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

replacements = {
    'Ã¢â‚¬â€œ': '–',
    'Ã¢â‚¬â€”': '—',
    'Ã¢Å“â€œ': '<i class="ph-bold ph-check"></i>',
    'Ã¢â‚¬Â¦': '...',
    'Ã¢â‚¬â„¢': "'",
    'Ã¢â‚¬Å“': '"',
    'Ã¢â‚¬Â ': '"',
    'Ã¢â‚¬Â': '"'
}

for old, new in replacements.items():
    content = content.replace(old, new)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

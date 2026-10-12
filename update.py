import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Change padding-top: 62.5% to 56.25% in refleksi-viewer
content = re.sub(
    r'class="refleksi-viewer portfolio-img-wrapper" style="position: relative; width: 100%; padding-top: 62\.5%;',
    r'class="refleksi-viewer portfolio-img-wrapper" style="position: relative; width: 100%; padding-top: 56.25%;',
    content
)

# 2. Remove the refleksi-controls block completely
controls_pattern = r'\s*<div class="refleksi-controls".*?</div>\s*</div>'
content = re.sub(controls_pattern, '', content, flags=re.DOTALL)

# 3. Change PDF to PPT text in SVG
content = re.sub(
    r'<text([^>]*)>PDF</text>',
    r'<text\1>PPT</text>',
    content
)

# 4. Change "Buka PDF di Drive" to "Lihat Materi PPT"
content = re.sub(
    r'Buka PDF di Drive',
    r'Lihat Materi PPT',
    content
)

# Wait, we need to copy the onclick from 'btn-ref-blue' (Preview 2) to 'pdf-overlay' within each refleksi-card.
# To do this safely, we can iterate over all refleksi-card divs.
cards = re.split(r'(<div class="refleksi-card[^>]*>)', content)
# cards[0] is everything before the first card.
# cards[1] is the opening tag of the first card.
# cards[2] is the inner content of the first card, until the next card's opening tag.

new_content = cards[0]
for i in range(1, len(cards)-1, 2):
    card_open = cards[i]
    card_inner = cards[i+1]
    
    # Check if there's an onclick in the Preview 2 button
    onclick_match = re.search(r'<a[^>]*onclick="([^"]*)"[^>]*>Preview 2</a>', card_inner)
    
    if onclick_match:
        onclick_attr = onclick_match.group(1)
        # Update the pdf-overlay a tag
        # Replace href="#" target="_blank" with href="#" onclick="..." 
        # Or if it already has onclick, replace it.
        # Let's just find the <a ... class="pdf-overlay"> tag.
        def replace_overlay(m):
            a_tag = m.group(0)
            if 'onclick' not in a_tag:
                a_tag = re.sub(r'target="_blank"', f'onclick="{onclick_attr}"', a_tag)
            return a_tag
            
        card_inner = re.sub(r'<a[^>]*class="pdf-overlay"[^>]*>', replace_overlay, card_inner)
        
    new_content += card_open + card_inner
    
if len(cards) % 2 == 0:
    new_content += cards[-1]

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(new_content)
print("Done updating index.html")

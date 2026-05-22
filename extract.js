const fs = require('fs');
const html = fs.readFileSync('index.html', 'utf-8');
const match = html.match(/<script>([\s\S]*?)<\/script>/);
if (match) {
    fs.writeFileSync('test_script.js', match[1]);
    console.log("Extracted");
} else {
    console.log("No match");
}

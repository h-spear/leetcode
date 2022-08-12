const fs = require('fs');

const home_dir = './';
const result = [];

const output_file = 'readme.md';

function check_condition(p) {
    if (!p.isDirectory()) {
        return false;
    }
    if (p.name[0] == '.') {
        return false;
    }
    return true;
}

fs.readdirSync(home_dir, { withFileTypes: true }).forEach((p) => {
    const name = p.name;
    const path = './' + name;
    if (!check_condition(p)) {
        return;
    }
    result.push({ name, length: fs.readdirSync(path).length });
});

// write md file
if (!fs.existsSync(output_file)) {
    fs.openSync(output_file, 'w', 666);
}

fs.writeFileSync(output_file, '');
fs.appendFileSync(output_file, `# LeetCode\n`, 'utf-8');

let total_alg = 0;
let total_sql = 0;
fs.appendFileSync(
    output_file,
    `## PYTHON\n|    Algorithm    | solved |\n| :-------------: | :----: |\n`,
    'utf-8'
);
result.forEach((v) => {
    const { name, length } = v;
    if (name === 'sql') {
        total_sql += length;
        return;
    }
    temp = '|' + name + '|' + length + '|\n';
    total_alg += length;
    fs.appendFileSync(output_file, temp, 'utf-8');
});
fs.appendFileSync(
    output_file,
    '| **sum** | **' + total_alg + '**|\n\n',
    'utf-8'
);

// SQL
fs.appendFileSync(
    output_file,
    `<br>\n\n ## SQL\n|    SQL    | solved |\n| :-------------: | :----: |\n`,
    'utf-8'
);

fs.appendFileSync(output_file, '|    MySQL    |' + total_sql + '|\n', 'utf-8');
fs.appendFileSync(
    output_file,
    '| **sum** | **' + total_sql + '**|\n\n',
    'utf-8'
);

console.log('algorithm solved ' + total_alg + '!');
console.log('sql solved ' + total_sql + '!');
console.log('saved successfully! ' + output_file);

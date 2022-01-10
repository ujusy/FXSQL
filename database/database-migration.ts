const fs = require('fs');
const {Pool} = require('pg');
const pool = new Pool({
    host: 'localhost',
    user: 'test',
    password: 'test',
    database: 'test',
    port: 8080
});

async function main() {
    const query = fs.readFileSync('../make/seed.sql', 'utf-8');
    console.log(query)
    await pool.query(query);
}

main()
    .then(() => {
        console.log('마이그레이션 완료');
    })
    .catch((e) => {
        console.log(e);
    });
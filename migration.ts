const { PostgreSQL } = require('fxsql');
const { CONNECT } = PostgreSQL;
const POOL = CONNECT({
    host: 'localhost',
    user: 'test',
    password: 'test',
    database: 'test',
    port: 8080
});

const { TRANSACTION } = POOL;

async function main() {
    const { QUERY, COMMIT, ROLLBACK, VALUES } = await TRANSACTION();

    const user = {name: '테스트'};
    await QUERY `INSERT INTO "user" ${VALUES(user)}`;

    await COMMIT();
}

main()
    .then(() => {
        console.log('Finished!');
    })
    .catch((e) => {
        console.log(e);
    });
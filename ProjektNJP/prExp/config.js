module.exports={
    port: process.env.PORT || 8081,
    pool: {
        connectionLimit: 10,
        host: 'localhost',
        user: 'root',
        password: 'rootpass',
        database: 'jsprojekt',
        debug: false
    },
    secret: "nekidugackistring"
}
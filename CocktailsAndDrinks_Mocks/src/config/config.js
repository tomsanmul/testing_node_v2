const dotenv = require('dotenv');
const path = require('path');

if (process.env.NODE_ENV === 'production') {
    console.log = function() {};
}

dotenv.config({ path: path.resolve(__dirname, process.env.NODE_ENV + '.env') });

module.exports = {
    NODE_ENV: process.env.NODE_ENV,
    HOST: process.env.HOST,
    BASE_URL: process.env.BASE_URL,
    PORT: process.env.PORT,
    TOKEN_PWD: process.env.TOKEN_PWD,
    TOKEN_EXPIRES: process.env.TOKEN_EXPIRES,
    UNIT_TOKEN_EXPIRES: process.env.UNIT_TOKEN_EXPIRES,
    DATABASE_URL: process.env.DATABASE_URL,
    DB_HOST: process.env.DB_HOST,
    DB_PORT: process.env.DB_PORT,
    DB_USER: process.env.DB_USER,
    DB_PASSWORD: process.env.DB_PASSWORD,
    DB_NAME: process.env.DB_NAME,
    DB_DIALECT: process.env.DB_DIALECT,
    URL_LOGS: process.env.URL_LOGS
}



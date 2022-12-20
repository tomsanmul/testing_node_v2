const config = require('./config/config');
const express = require('express');
const cors = require('cors');
const app = express();
const logger = require ('./config/logger');


app.use(cors());
// Configurar cabeceras y cors
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});

app.use (require ('./route/index.routes'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.listen(config.PORT, () => {
    logger.info('Listening port:' + config.PORT);
});





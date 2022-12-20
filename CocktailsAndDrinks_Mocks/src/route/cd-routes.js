const express = require('express');
const app = express()
const bodyParser = require('body-parser')
const config = require('../config/config');
const jsonParser = bodyParser.json();
const router = express.Router();
const cdcontroller = require('../controller/cd-controller');

router.get(config.BASE_URL.concat('/ping'), cdcontroller.ping);
router.get(config.BASE_URL.concat('/categories'), cdcontroller.categories);
router.get(config.BASE_URL.concat('/category/:idCategory'), cdcontroller.category);
router.get(config.BASE_URL.concat('/stock'), cdcontroller.stock);


module.exports = app;
module.exports = router;

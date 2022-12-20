const CDService = require('../service/index.service');
const logger = require ('../config/logger');

const ping = (req, resp) => resp.status(200).send({'msg': 'pong'});

const categories = (req, resp) => {
    CDService.getAllCategories.then(data => {
        resp.status(200).json(data);
    }).catch(err=> {
        logger.error(err.toString());
        resp.status(500).json([]);
    });

}

const category = (req, resp) => {

    let idCategory = req.params.idCategory;

    CDService.getCategory(idCategory).then(data => {
        resp.status(200).json(data);
    }).catch(err=> {
        logger.error(err.toString());
        resp.status(500).json([]);
    });

}

const stock = (req, resp) => {
    CDService.getStock.then(data => {
        resp.status(200).json(data);
    }).catch(err=> {
        logger.error(err.toString());
        resp.status(500).json([]);
    });

}

module.exports = {
    ping,
    categories,
    category,
    stock
}
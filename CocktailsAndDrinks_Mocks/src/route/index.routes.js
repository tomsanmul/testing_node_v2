const express = require('express');
const app = express();

app.use (require ('./cd-routes'));
module.exports = app;

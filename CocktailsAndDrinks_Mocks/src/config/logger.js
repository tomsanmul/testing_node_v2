const winston = require('winston');
require('winston-daily-rotate-file');
const config = require('./config');

const transportConsole = new winston.transports.Console({
    name: 'info-console',
    format: winston.format.combine(
        winston.format.timestamp({format: 'DD-MMM-YYYY HH:mm:ss'}),
        winston.format.align(),
        winston.format.printf(info => `${info.level}: ${[info.timestamp]}: ${info.message}`)
    )});

/* LOG LEVELS:
{
  error: 0,
  warn: 1,
  info: 2,
  http: 3,
  verbose: 4,
  debug: 5,
  silly: 6
}
 */

const transportDailyRotateFile = new winston.transports.DailyRotateFile({
    filename: config.URL_LOGS + 'testing_node_v2-%DATE%.log',
    level: 'warn',
    datePattern: 'YYYY-MM-DD',
    zippedArchive: true,
    maxSize: '20m',
    maxFiles: '14d',
    format: winston.format.combine(
        winston.format.timestamp({format: 'DD-MMM-YYYY HH:mm:ss'}),
        winston.format.align(),
        winston.format.printf(info => `${info.level}: ${[info.timestamp]}: ${info.message}`),
    )});

transportDailyRotateFile.on('rotate', function(oldFilename, newFilename) {


});

const logger = winston.createLogger({
    transports: [
        transportConsole,
        transportDailyRotateFile
    ]
});

module.exports = logger;

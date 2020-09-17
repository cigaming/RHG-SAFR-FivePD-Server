//
// run node watchlogs while editing the config file
//
var logger = require('../lib/logger') // require('consolelogger')
logger.configure('./myconfig.json')

var log = logger.getLogger(),
    log1 = logger.getLogger('category1'),
    log2 = logger.getLogger('category2'),
    log3 = logger.getLogger('category3')

function logall() {
  log.trace('trace from default logger ')
  log1.trace('trace from category1')
  log2.trace('trace from category2')
  log3.trace('trace from category3')

  log.debug('debug from default logger ')
  log1.debug('debug from category1')
  log2.debug('debug from category2')
  log3.debug('debug from category3')

  log.info('info from default logger ')
  log1.info('info from category1')
  log2.info('info from category2')
  log3.info('info from category3')

  log.warn('warn from default logger ')
  log1.warn('warn from category1')
  log2.warn('warn from category2')
  log3.warn('warn from category3')

  log.error('error from default logger ')
  log1.error('error from category1')
  log2.error('error from category2')
  log3.error('error from category3')

  log.fatal('fatal from default logger ')
  log1.fatal('fatal from category1')
  log2.fatal('fatal from category2')
  log3.fatal('fatal from category3')

  console.log('------------------------------------')
  //logger.flush()
  setTimeout(logall, 1500)
}

logall()

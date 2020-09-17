var logger = require('../lib/logger') // require('consolelogger')

logger.configure({level:'debug'})
var log = logger.getLogger('example')

console.log(log.isTraceEnabled())
console.log(log.isDebugEnabled())
console.log(log.isInfoEnabled())

logger.debug('A DEBUG message using logger directly')
logger.info('An INFO message using logger directly')

log.trace('should not show up')
log.debug('a debug message')
log.info('an info message')
log.error('Hello %s', 'world')

log = logger.getLogger()
log.info('Message using default logger')

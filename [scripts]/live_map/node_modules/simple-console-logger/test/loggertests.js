var assert = require('assert')
var logger = require('../../consolelogger')

describe('console logger tests', function () {

  it('should export the right functions', function () {
    assert(typeof logger.getLogger === 'function')
    assert(typeof logger.configure === 'function')
    assert(typeof logger.getLevel === 'function')
    assert(typeof logger.getCategoryLevel === 'function')
  })

  it('should support level configuration', function () {
    logger.configure({level: 'off'})
    assert(logger.getLevel() === 'off')

    logger.configure({level: 'trace'})
    assert(logger.getLevel() === 'trace')

    logger.configure({level: 'debug'})
    assert(logger.getLevel() === 'debug')

    logger.configure({level: 'info'})
    assert(logger.getLevel() === 'info')

    logger.configure({level: 'warn'})
    assert(logger.getLevel() === 'warn')

    logger.configure({level: 'error'})
    assert(logger.getLevel() === 'error')

    logger.configure({level: 'fatal'})
    assert(logger.getLevel() === 'fatal')
  })

  it('should support category configuration', function () {
    logger.configure({
      level: 'info',
      levels: {
        category1: 'debug',
        category2: 'error'
      }
    })
    assert(logger.getLevel() === 'info')
    assert(logger.getCategoryLevel('category1') === 'debug')
    assert(logger.getCategoryLevel('category2') === 'error')
    assert(logger.getCategoryLevel('notfound') === 'info')  // default
  })

  it('should get loggers with the right level', function () {
    logger.configure({
      level: 'info',
      levels: {
        category1: 'debug',
        category2: 'error'
      }
    })
    var log = logger.getLogger()
    assert(log.getLevel() === 'info')

    log = logger.getLogger('category1')
    assert(log.getLevel() === 'debug')

    log = logger.getLogger('category2')
    assert(log.getLevel() === 'error')

    log = logger.getLogger('notconfigured')
    assert(log.getLevel() === 'info')
  })

  it('should change levels correctly', function () {
    logger.configure({
      level: 'info',
      levels: {
        category1: 'debug',
        category2: 'error',
        category3: 'off'
      }
    })
    var log = logger.getLogger()
    assert(log.getLevel() === 'info')

    log1 = logger.getLogger('category1')
    assert(log1.getLevel() === 'debug')

    log2 = logger.getLogger('category2')
    assert(log2.getLevel() === 'error')

    log3 = logger.getLogger('category3')
    assert(log3.getLevel() === 'off')

    logger.configure({
      level: 'warn',
      levels: {
        category1: 'error',
        category2: 'off',
      }
    })

    assert(log.getLevel() === 'warn')
    assert(log1.getLevel() === 'error')
    assert(log2.getLevel() === 'off')
    assert(log3.getLevel() === 'warn')
    assert(logger.getLogger('new').getLevel() === 'warn')
    assert(logger.getLogger('category1').getLevel() === 'error')
  })

  it('should enable and disable default logger on level', function () {
    var log = logger.getLogger()

    logger.configure({level: 'off'})
    assert(!log.isFatalEnabled())
    assert(!log.isErrorEnabled())
    assert(!log.isWarnEnabled())
    assert(!log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({level: 'fatal'})
    assert(log.isFatalEnabled())
    assert(!log.isErrorEnabled())
    assert(!log.isWarnEnabled())
    assert(!log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({level: 'error'})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(!log.isWarnEnabled())
    assert(!log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({level: 'warn'})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(log.isWarnEnabled())
    assert(!log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({level: 'info'})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(log.isWarnEnabled())
    assert(log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({level: 'debug'})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(log.isWarnEnabled())
    assert(log.isInfoEnabled())
    assert(log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({level: 'trace'})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(log.isWarnEnabled())
    assert(log.isInfoEnabled())
    assert(log.isDebugEnabled())
    assert(log.isTraceEnabled())
  })

  it('should work with the ALL category', function () {
    var log = logger.getLogger()

    logger.configure({levels: {'[all]': 'off'}})
    assert(!log.isFatalEnabled())
    assert(!log.isErrorEnabled())
    assert(!log.isWarnEnabled())
    assert(!log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({levels: {'[all]': 'fatal'}})
    assert(log.isFatalEnabled())
    assert(!log.isErrorEnabled())
    assert(!log.isWarnEnabled())
    assert(!log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({levels: {'[all]': 'info'}})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(log.isWarnEnabled())
    assert(log.isInfoEnabled())
    assert(!log.isDebugEnabled())
    assert(!log.isTraceEnabled())

    logger.configure({levels: {'[all]': 'trace'}})
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(log.isWarnEnabled())
    assert(log.isInfoEnabled())
    assert(log.isDebugEnabled())
    assert(log.isTraceEnabled())
  })

  it('should work with the specific categories', function () {
    var log1 = logger.getLogger('category1'),
        log2 = logger.getLogger('category2'),
        log3 = logger.getLogger('category3'),
        log = logger.getLogger()

    logger.configure({levels: {
        '[all]': 'error',
        category1: 'debug'
      }
    })
    assert(log.isFatalEnabled())
    assert(log.isErrorEnabled())
    assert(!log.isInfoEnabled())

    assert(log1.isDebugEnabled())
    assert(!log2.isInfoEnabled())
    assert(!log2.isInfoEnabled())
    assert(log3.isErrorEnabled())

    logger.configure({levels: {
        '[all]': 'off',
        category1: 'debug',
        category2: 'error'
      }
    })

    assert(log1.isDebugEnabled())
    assert(!log2.isInfoEnabled())
    assert(log2.isErrorEnabled())

    assert(!log.isFatalEnabled())
  })

})

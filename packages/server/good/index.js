const plugin = require('@hapi/good');
const { Squeeze } = require('@hapi/good-squeeze');

module.exports = {
  plugin,
  options: {
    reporters: {
      myConsoleReporter: [
        {
          module: Squeeze,
          name: 'Squeeze',
          args: [{ log: '*', response: '*', error: '*' }]
        },
        {
          module: '@hapi/good-console'
        },
        'stdout'
      ]
    }
  }
};

const Glue = require('@hapi/glue');
const { manifest, options } = require('./config');

module.exports = async () => {
  try {
    const server = await Glue.compose(
      manifest,
      options
    );

    return server;
  } catch (error) {
    // eslint-disable-next-line no-console
    return console.warn(error);
  }
};

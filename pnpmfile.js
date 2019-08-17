module.exports = {
  hooks: {
    readPackage(manifest) {
      switch (manifest.name) {
        case '@hapi/good':
          manifest.peerDependencies = {
            '@hapi/good-console': '*',
            '@hapi/good-squeeze': '*',
            ...manifest.peerDependencies
          };
      }
      return manifest;
    }
  }
};

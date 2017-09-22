const debug = require('debug');
const wilu = require('wilu');
const pkg = require('./package.json');

const log = debug('napi-bones-make');

(async function () {
  try {
    await wilu(pkg);
  } catch(e) {
    log(e);
  }
})();

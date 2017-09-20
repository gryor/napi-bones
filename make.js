const debug = require('debug');
const wilu = require('wilu');
const pkg = require('./package.json');

const log = debug('napi-bones-make');

(async function () {
	try {
		pkg.build = pkg.build || {};
		Object.assign(pkg.build, {
			name: pkg.name,
			version: pkg.version
		});
		await wilu(pkg.build);
	} catch(e) {
		log(e);
	}
})();

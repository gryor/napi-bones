# napi-bones
Node.js N-API example addon

# Try
```sh
git clone https://github.com/wilhelmmatilainen/napi-bones
cd napi-bones
npm i
make
node --napi-modules index.js
```
*Results to*
```
hello_world registered
{ hello_world: [Function] }
Hello World!
(node:4315) Warning: N-API is an experimental feature and could change at any time.
```

## Regenerate the Makefile
```sh
node make.js
```

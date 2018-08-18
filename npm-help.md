# npm-help

## login
```sh
npm login
dalijolijo
```

## publish
```sh
git clone https://github.com/dalijolijo/NEW_PKG.git
cd NEW_PKG/
npm publish
```

## installation
After publishing your package to npm. Make a new directory outside of your project and switch to the new directory.
```sh
npm install NEW_PKG
npm install NEW_PKG@^6.0.0
npm audit fix
```

## Troubleshooting
Error:
```sh
npm ERR! path /root/proof/proofofexistence-new/app/node_modules/bitcore-lib-btx
npm ERR! code EISGIT
npm ERR! git /root/proof/proofofexistence-new/app/node_modules/bitcore-lib-btx: Appears to be a git repo or submodule.
npm ERR! git     /root/proof/proofofexistence-new/app/node_modules/bitcore-lib-btx
npm ERR! git Refusing to remove it. Update manually,
npm ERR! git or move it out of the way first.
```
Solution:
```sh
npm install --save https://github.com/dalijolijo/bitcore-lib-btx.git
```
OR Add .git to .npmignore

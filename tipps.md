## Diff files
```sh
apt-get install wdiff colordiff
wdiff btc-0.15.travis btx-015.travis | colordiff
diff -y btc-0.15.travis btx-015.travis | colordiff
diff -y btc-0.15.travis btx-015.travis | grep -E "apt-get|deploy" | colordiff
```

## Check open RPC port
```sh
#BTX
curl --user user:password --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://127.0.0.1:8556/
#BSD
curl --user user:password --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://127.0.0.1:8800/
#BTDX
curl --user user:password --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://127.0.0.1:8330/
#MEC
curl --user user:password --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://127.0.0.1:7952/
```

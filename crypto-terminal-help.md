# crypto-terminal-help

## Test
Edit https://github.com/dalijolijo/crypto-terminal/edit/master/test/unit/payment-methods/bitcoin.js

Use infos:
1. https://github.com/dalijolijo/hd-wallet-derive

### bitcore (legacy)
```sh
./hd-wallet-derive.php -g --coin=BTX --key=xpub69V9b3wdTWG6Xjtpz5dX8ULpqLKzci3o7YCb6xQUpHAhf3dzFBNeM4GXTSBff82Zh524oHpSPY4XimQMCbxAsprrh7GmCNpp9GNdrHxxqJo --cols=path,address --path=m/0/x''
+-------+------------------------------------+
| path  | address                            |
+-------+------------------------------------+
| m/0/0 | 2VjaHdJvPo4FvStSMYzoEvEnj7PvU3qi2t |
| m/0/1 | 2ZhyBevuGF37m84CuwdKhuMjjkPg3ZpiWY |
| m/0/2 | 2RWcpVWBuwNfQWoWFaqWVS4ky7yjRjbCg8 |
| m/0/3 | 2TMyXxmFAcxnhMNMzeJWWkhNc2V1ZoZHK4 |
| m/0/4 | 2apCAXAmpDT3bmUfuiJfp9jK9RjNGd6vH6 |
| m/0/5 | 2QfXqXepr514p5Pk1qERwTiFhg6nmPhyGm |
| m/0/6 | 2FybkANHbdbtLpo7A4cRwhRystD54uphm8 |
| m/0/7 | 2HFq32SF88ysxELktRUWkd8JaTupRh5qbm |
| m/0/8 | 2PTUgoWeA7br5pHcxCETMjMY4z3DugePXu |
| m/0/9 | 2R6THCSm8ktMZ4mYKj2RV2QaL5WtDmsgqf |
+-------+------------------------------------+
```

### bitcore (segwit backwards compatible)
```sh
./hd-wallet-derive.php -g --coin=BTX --key=ypub6aF3kr3WGbpBBEUnY5WXhkE8581B8LH36No7fTzLrNBTEB2n5fLEjEUwPd8QqLppdS2dWdhULB5q4xp9Ter3iivhUaYuu4m3zmmVQvvwnTX --cols=path,address --path=m/0/x''

+-------+------------------------------------+
| path  | address                            |
+-------+------------------------------------+
| m/0/0 | sLCarZYA6Ex9WrktajhmvHtkD1o5MZtnnA |
| m/0/1 | shHzhQzx3pDTKptReptWh1vNY7fiymNv5P |
| m/0/2 | saSvY336YujdomMZ6NbYdYJysagX58afL6 |
| m/0/3 | sgup96r1CoUwDugd6YkpqCitTZQeQPGToe |
| m/0/4 | sTpauoG3Qi6cJfPeLt4x3KYHauVYW7uTVq |
| m/0/5 | sZQPVDLGX7h7YHofnTT6r6xcaMkKJZvnzq |
| m/0/6 | sKuSi5aHULWTfsV62or67xDWeW6NNYJRXL |
| m/0/7 | sfCGp6HyoH8zuxbmsTvcEiB1Aoo1yhfgFG |
| m/0/8 | sW1pvM3b9s93nJC6AfqTo2xSmjtgMMLMHm |
| m/0/9 | sekHf9EzyzounbqVgJZ5osaJAiQMQLX5Cn |
+-------+------------------------------------+
```

## Payment-method
Create https://github.com/dalijolijo/crypto-terminal/blob/master/js/payment-methods/bitcore.js

Use infos: 
1. https://github.com/LIMXTEC/awesome-bitcore-btx#network-details
2. https://github.com/dalijolijo/coinparams/blob/master/coins/btx.json


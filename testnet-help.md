# testnet-help

Find bitcore-cli in Bitcore Insight Explorer Docker Container (Testnet) here: /home/bitcore/src

## Create links in Bitcore Insight Explorer Docker Container (Testnet)
```sh
ln -s /home/bitcore/bitcore-testnet/bin/mynode/data/bitcore.conf /root/.bitcore/bitcore.conf
ln -s /home/bitcore/bitcore-testnet/bin/mynode/data/testnet3 /root/.bitcore/
```

## Status requests
```sh
./bitcore-cli -testnet getnetworkinfo
./bitcore-cli -testnet getblockchaininfo
./bitcore-cli -testnet getwalletinfo
```

## Mining on testnet
```sh
./bitcore-cli -testnet generate 5
```

## Wallet 
```sh
./bitcore-cli -testnet getbalance
```

## Logging
```sh
tail -f /root/.bitcoin/testnet3/debug.log
```

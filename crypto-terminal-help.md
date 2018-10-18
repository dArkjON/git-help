# crypto-terminal-help

## Test
Edit https://github.com/dalijolijo/crypto-terminal/edit/master/test/unit/payment-methods/bitcoin.js

Use infos:
1. https://github.com/dalijolijo/hd-wallet-derive

### Generate pub-keys
```sh
/hd-wallet-derive.php --coin=BTX --gen-key -g --format=jsonpretty
[
    {
        "coin": "BTX",
        "seed": "c1e3501ed7bee827a57aeae874afebcfed2208e10c4d95d440dacf20a399e2f8ad5ff55b74d6370352d1b8bfd5ac275d8d06ffdb419f65477455a2925749b1ba",
        "mnemonic": "casino lens sort oil slim scan win spin diary hidden wise sketch exchange burger arm dish dress spatial merry dash sudden identify prevent name truck entire tennis antique wrestle topic pilot horse ahead bonus winner thumb resemble sketch tourist tank company very destroy turn negative flock foam morning",
        "root-key": "xprv9s21ZrQH143K3iYKGY3NbAiAfqdByZdrEYazssyqpCmjwuHxhdbLSnuWe7q6yXtsdMNNLS5s9iWLYCVYChappMjyCPHHeHv1if2PJ4t1Qs3",
        "path": "m\/44'\/160'\/0'\/0",
        "xprv": "xprvA1xgzmD2iGY1pMcMGDtb1co2sECq3cV6afvkBSt8vce6cw9efmeSTekobM4B9CawXnX9scbLaotbh3Njn8V3wnEZt9bwMYQxNiDQ3oxCRQy",
        "xpub": "xpub6Ex3QGjvYe6K2qgpNFRbNkjmRG3KT5CwwtrLyqHkUxB5VjUoDJxh1T5HScHaN67gdZKqiR6sfPtdfUJW1PxPy51PnjohbEnvrwojnQb6MFa",
        "comment": null
    },
    {
        "coin": "BTX",
        "seed": "c1e3501ed7bee827a57aeae874afebcfed2208e10c4d95d440dacf20a399e2f8ad5ff55b74d6370352d1b8bfd5ac275d8d06ffdb419f65477455a2925749b1ba",
        "mnemonic": "casino lens sort oil slim scan win spin diary hidden wise sketch exchange burger arm dish dress spatial merry dash sudden identify prevent name truck entire tennis antique wrestle topic pilot horse ahead bonus winner thumb resemble sketch tourist tank company very destroy turn negative flock foam morning",
        "root-key": "yprvABrGsX5C9janu1jS6tpzoFofqomdvBdM9f7DfGsjCD9d117BxHku4rZefKngySYo2zVB5ugRcNrtRV76vPzqcbRa4iyiECjVzP62gZqgC6G",
        "path": "m\/49'\/160'\/0'\/0",
        "xprv": "yprvALQvcFJ65kFLa8Ya33rqt4pwMpNK1XXq1C6Tr6XmnwQMcDRK6J7xRPZqq4Bdwjxmm8WvngL4go1b8FnQdwoPdA6hoZ5xtgztvC8buP6TUZf",
        "xpub": "ypub6ZQH1kpyv7odncd395PrFCmfurCoQzFgNR24eUwPMGwLV1kTdqSCyBtKgLhzSpHjzMziEJ5F9AAZWvvN4KagH9RqQyKymwCCEJtrF84rjSr",
        "comment": null
    },
    {
        "coin": "BTX",
        "seed": "c1e3501ed7bee827a57aeae874afebcfed2208e10c4d95d440dacf20a399e2f8ad5ff55b74d6370352d1b8bfd5ac275d8d06ffdb419f65477455a2925749b1ba",
        "mnemonic": "casino lens sort oil slim scan win spin diary hidden wise sketch exchange burger arm dish dress spatial merry dash sudden identify prevent name truck entire tennis antique wrestle topic pilot horse ahead bonus winner thumb resemble sketch tourist tank company very destroy turn negative flock foam morning",
        "root-key": "zprvAWgYBBk7JR8GkJvYwFcd1LuB1mv5rocr4mdSSfmcaDXW46vRCwvTgvDngXkGyMCiSdbyqPGz53DSJmife6QrQq7Aw4g8p7YzG79g5ATrHu9",
        "path": "m\/84'\/160'\/0'\/0",
        "xprv": "zprvAfjTvoj8mVjd9f67owqo4a7iwHBW8VvkkFC4PmvABESctiinVzz1oFh7NtkajY8PjoHyqKKKTMn5wsbHic5wfd2So2YGLF52iySmLWAjs5Z",
        "xpub": "zpub6tipLKG2bsHvN9AauyNoRi4TVK1zXxec7U7fCAKmjZybmX3w3YJGM41bEDX1zCKr1HAXnqwFVFcLE9tfFU1yj1fR4VQuEVpuS11F5MEac3R",
        "comment": null
    }
]
```

### bitcore (legacy)
```sh
./hd-wallet-derive.php -g --coin=BTX --key=xpub6Ex3QGjvYe6K2qgpNFRbNkjmRG3KT5CwwtrLyqHkUxB5VjUoDJxh1T5HScHaN67gdZKqiR6sfPtdfUJW1PxPy51PnjohbEnvrwojnQb6MFa --cols=path,address --path=m/0/x''

+-------+------------------------------------+
| path  | address                            |
+-------+------------------------------------+
| m/0/0 | 2MhCptvgxXc19XFJqCQafgzNegzMwjBLYN |
| m/0/1 | 2KZdb2EMiAxyaC4VrigWnLM1GcduGg3uwQ |
| m/0/2 | 2RRt4yzNS4S8DSU3PtJXzMFqibQvQjvGuJ |
| m/0/3 | 2KyYotg6XWz5esYMpZH3Hns7rpXdCbrnk6 |
| m/0/4 | 2GTcSafGMSmgGM1z4xUuCb2d84EzmKBmEU |
| m/0/5 | 2Yvcogt2AQ3X565iWCRV45oi67Vz62EERi |
| m/0/6 | 2WrAU2Hwqy1hDzgPQ2EPCn2PKG4i2jwZ9U |
| m/0/7 | 2P1VH4ibPAhthiZHkBQsoD9JzateQ4GH8L |
| m/0/8 | 2DhjeUuy29gT1iKvYBEaGMScmBYGDcLUZT |
| m/0/9 | 2PRrcktiefhAsvfFhMJ423yGUjgE4ENoMh |
+-------+------------------------------------+
```

### bitcore (segwit backwards compatible)
```sh
./hd-wallet-derive.php -g --coin=BTX --key=ypub6ZQH1kpyv7odncd395PrFCmfurCoQzFgNR24eUwPMGwLV1kTdqSCyBtKgLhzSpHjzMziEJ5F9AAZWvvN4KagH9RqQyKymwCCEJtrF84rjSr --cols=path,address --path=m/0/x''

+-------+------------------------------------+
| path  | address                            |
+-------+------------------------------------+
| m/0/0 | sUNYrxTL1jQ4aNNDbt7SLEUqmF9kCBbLCN |
| m/0/1 | sQ1NDtge4ubSQdNk1ZP4AKLwy1MSxyaK28 |
| m/0/2 | sNXrxojtGR8Fgm3qtMjBorYwo8GkrVLs2o |
| m/0/3 | sfLELZ5c62VzeyucBq79AcTHdQp1AboWYq |
| m/0/4 | sTz4X2nxfgSaGy1cco2i5MSqjcwg6aaiqS |
| m/0/5 | saBbxTfTBKLuS5XC9BiKuMVTy4pXAmgkDs |
| m/0/6 | sKmq4GURkiFCryDjs396KnnqvE9YUgNLwj |
| m/0/7 | sbLpahdqUTdWFPNzkjn56PaksAtauL2jFG |
| m/0/8 | sd81r8ZQkku2GsTF3XGgB1avLGxJsCdD8z |
| m/0/9 | schKTBWSCxax8PDucnrqDPeWqsNuMJGp3T |
+-------+------------------------------------+
```

### bitcore (segwit native)
```sh
./hd-wallet-derive.php -g --coin=BTX --key=zpub6tipLKG2bsHvN9AauyNoRi4TVK1zXxec7U7fCAKmjZybmX3w3YJGM41bEDX1zCKr1HAXnqwFVFcLE9tfFU1yj1fR4VQuEVpuS11F5MEac3R --cols=path,address --path=m/0/x''

+-------+---------------------------------------------+
| path  | address                                     |
+-------+---------------------------------------------+
| m/0/0 | btx1qeuzfa972qtq8am2p8kn3xm404nq27vhf5u7zce |
| m/0/1 | btx1qfknts7876lrqeqyjrkuz3laf59jpxt2ltg6a2j |
| m/0/2 | btx1qt5ersdeegyg6g3paprkl6sw75gx3fu2p0w09z4 |
| m/0/3 | btx1qpqxjnmgdm9hmkg7a2fmmcw79zuz5g29jfu8lmf |
| m/0/4 | btx1q6edfl6ufxh0ewrltanh23666c52wch632edc3y |
| m/0/5 | btx1qdclhxrw4m2dyzmm8d0qgqekn3kkk6vyl8asfej |
| m/0/6 | btx1q2rdx3jpdw2uveneerenkfs4v97uvclfsxt9jcv |
| m/0/7 | btx1qsvx45g8r9mj0ngjgpx7qsn9me30d0nvf29l5c2 |
| m/0/8 | btx1qrp77tuuf8j842wmwpzury7ap47ad06c39jk2em |
| m/0/9 | btx1qkg5d2k7ul0acuj5gy2nung538eqrzknh3hgf6n |
+-------+---------------------------------------------+
```

## Payment-method
Create https://github.com/dalijolijo/crypto-terminal/blob/master/js/payment-methods/bitcore.js

Use infos: 
1. https://github.com/LIMXTEC/awesome-bitcore-btx#network-details
2. https://github.com/dalijolijo/coinparams/blob/master/coins/btx.json


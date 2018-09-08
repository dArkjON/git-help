# HowTo - NBitcoin Integration
https://github.com/MetacoSA/NBitcoin

See reference implementation of BitCore here: https://github.com/dalijolijo/NBitcoin/commit/c9594de09641fbf242644d357e61c2952e6a5bba

## 1) Add changes to following files:
- NBitcoin.Altcoins/AltcoinNetworkSets.cs
- NBitcoin.Altcoins/README.md
- NBitcoin.TestFramework/WellknownNodeDownloadData.cs
- NBitcoin.Tests/NodeBuilderEx.cs

## 2) Copy to new ALTCOIN.cs
- NBitcoin.Altcoins/Bitcore.cs


## 3) Changes all parameters in NBitcoin.Altcoins/ALTCOIN.cs

### Get Genesis Block for main/test/regtest with:
Execute the CLI with parameter getblock with genesis hash to get the genesis raw tx block. 
If the wallet version is 15.x the CLI getblock command is with 0 in the end (instead false).
```sh
bitsend-cli getblock 0000012e1b8843ac9ce8c18603658eaf8895f99d3f5e7e1b7b1686f35e3c087a false
```
Hint: Your wallet must activate txindex (txindex=1)

#### For Regtest (BitSend)
Create config file /root/.bitsend/regtest/bitsend.conf
```sh
rpcpassword=1
rpcport=18332
txindex=1
```

Start Bitsend daemon in regtest:
```sh
screen ./bitsendd --regtest
```

Execute CLI command to get the genesis raw tx block:
```sh
./bitsend-cli -rpcpassword=1 -rpcport=18332 getblock 8a94df62a4e9bb64fbb8d22e63d075f3a3ab26672e79fbf243ff6cb02c695c15 false

```

#### For Regtest (Bitcloud)
Create config file /root/.bitcloud/regtest/bitcloud.conf
```sh
rpcpassword=1
rpcuser=a
rpcport=8329
txindex=1
```

Start Bitsend daemon in regtest:
```sh
screen ./bitcloudd -conf=/root/.bitcloud/regtest/bitcloud.conf -listen=0
```

Execute CLI command to get the genesis raw tx block:
```sh
./bitcloud-cli -conf=/root/.bitcloud/regtest/bitcloud.conf getblock 000002d56463941c20eae5cb474cc805b646515d18bc7dc222a0885b206eadb0 false
```

### IPv6 seeds
#### Convert IPv4 Adresses to IPv6
see here: https://www.ultratools.com/tools/ipv4toipv6Result?address=37.120.186.85 and https://ipv6-literal.com/?ipv6=0%3A0%3A0%3A0%3A0%3Affff%3A330f%3Adee0

#### Use the IPv4 Seed IPs to convert it:
```sh
new DNSSeedData("37.120.186.85", "37.120.186.85"),
```
- 37 => 0x25
- 120 => 0x78
- 186 => 0xBA
- 85 => 0x55
RESULT: 0000:0000:0000:0000:0000:ffff:2578:BA55


### Get needed coin information
Find all needed parameters in the following ALTCOIN source files:
- src/chainparams.cpp
  - nToCheckBlockUpgradeMajority == MajorityWindow??
- src/chainparamsbase.cpp
- src/version.h
- src/consensus/consensus.h


## 4) Test
Activate new ALTCOIN in NBitcoin.Tests/NodeBuilderEx.cs
```sh
dotnet test NBitcoin.Tests.csproj --filter "Altcoins=Altcoins" -p:ParallelizeTestCollections=false --framework netcoreapp2.1
```

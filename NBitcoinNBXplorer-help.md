# HowTo - NBitcoin / NBXplorer Integration
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

### Get Genesis Block
Execute the CLI with parameter getblock with genesis hash to get the genesis raw tx block. 
If the wallet version is 15.x the CLI getblock command is with 0 in the end (instead false).

* Hint: Your wallet must activate txindex (txindex=1)

#### For Testnet (BitSend)
Create config file /root/.bitsend/testnet3/bitsend.conf
```sh
rpcuser=a
rpcpassword=1
rpcport=18800
txindex=1
```

Start Bitsend daemon in testnet:
```sh
screen ./bitsendd -testnet -conf=/root/.bitsend/testnet3/bitsend.conf
```

Execute CLI command to get the genesis raw tx block:
```sh
./bitsend-cli -testnet -rpcuser=a -rpcpassword=1 -rpcport=18800 getblock 000003a68444b3c63b7882dd7244cd8ce1d11a30809295ab382bfdcab6d45332 false
01000000000000000000000000000000000000000000000000000000000000000000000057df57a347a2e5cf9b6973bbdf7a8585a0b595a8a8d7c7b6318cb79489f6c4c03e4f9253f0ff0f1e4fc0473d0101000000010000000000000000000000000000000000000000000000000000000000000000ffffffff4304ffff001d01043b6c696d65636f696e58206f667265636520616d706c69612067616d6120646520736572766963696f732079206d656a6f7261732070617261207469ffffffff0100e40b54020000004341040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9ac00000000
```

#### For Regtest (BitSend)
Create config file /root/.bitsend/regtest/bitsend.conf
```sh
rpcuser=a
rpcpassword=1
rpcport=18332
txindex=1
```

Start Bitsend daemon in regtest:
```sh
screen ./bitsendd -regtest -conf=/root/.bitsend/regtest/bitsend.conf
```

Execute CLI command to get the genesis raw tx block:
```sh
./bitsend-cli -regtest -rpcuser=a -rpcpassword=1 -rpcport=18332 getblock 00000d500e703fb0d5efc44e6987e2b479bef162c0934d95cdcb5a9808e8d2db false
01000000000000000000000000000000000000000000000000000000000000000000000057df57a347a2e5cf9b6973bbdf7a8585a0b595a8a8d7c7b6318cb79489f6c4c03f4f9253f0ff0f1ecf6713d60101000000010000000000000000000000000000000000000000000000000000000000000000ffffffff4304ffff001d01043b6c696d65636f696e58206f667265636520616d706c69612067616d6120646520736572766963696f732079206d656a6f7261732070617261207469ffffffff0100e40b54020000004341040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9ac00000000
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
screen ./bitcloudd -regtest -conf=/root/.bitcloud/regtest/bitcloud.conf -listen=0
```

Execute CLI command to get the genesis raw tx block:
```sh
./bitcloud-cli -regtest -conf=/root/.bitcloud/regtest/bitcloud.conf getblock 000002d56463941c20eae5cb474cc805b646515d18bc7dc222a0885b206eadb0 false
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


## 4) NBitcoin Test
Activate new ALTCOIN in NBitcoin.Tests/NodeBuilderEx.cs
```sh
mkdir log
dotnet test NBitcoin.Tests.csproj --filter "Altcoins=Altcoins" -p:ParallelizeTestCollections=false --framework netcoreapp2.1 | tee log/nbitcoin.tests.ALTCOIN.log
grep -r "Failed  " log/nbitcoin.tests.ALTCOIN.log
```

### NBXplorer Tests
For all test execute:
```sh
cd NBXplorer.Tests
dotnet test
```

The highest debug level is ``-v diag`` 
```sh
#BTX
cd NBXplorer.Tests
mkdir log
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.RepositoryCanTrackAddresses"  | tee log/RepositoryCanTrackAddresses 
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanSerializeKeyPathFast"  | tee log/CanSerializeKeyPathFast
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.ShouldBlockIfNoChange"  | tee log/ShouldBlockIfNoChange
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanEasilySpendUTXOs"  | tee log/CanEasilySpendUTXOs
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.ShowRBFedTransaction" | tee log/ShowRBFedTransaction
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanGetUnusedAddresses" | tee log/CanGetUnusedAddresses
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanSendAzureServiceBusNewBlockEventMessage" | tee log/CanSendAzureServiceBusNewBlockEventMessage
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanSendAzureServiceBusNewTransactionEventMessage" | tee log/CanSendAzureServiceBusNewTransactionEventMessage
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanUseWebSockets" | tee log/CanUseWebSockets
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanUseWebSockets2" | tee log/CanUseWebSockets2 
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrack4" | tee log/CanTrack4
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrack3" | tee log/CanTrack3
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrack2" | tee log/CanTrack2
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrackSeveralTransactions"| tee log/CanTrackSeveralTransactions
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanReserveAddress" | tee log/CanReserveAddress
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanParseDerivationScheme" | tee log/CanParseDerivationScheme
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanGetStatus" | tee log/CanGetStatus
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanGetTransactionsOfDerivation" | tee log/CanGetTransactionsOfDerivation
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrack5" | tee log/CanTrack5
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanRescan" | tee log/CanRescan
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrack" | tee log/CanTrack
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTopologicalSort" | tee log/CanTopologicalSort
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTopologicalSortTx" | tee log/CanTopologicalSortTx
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanBroadcast" | tee log/CanBroadcast
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanReserveDirectAddress" | tee log/CanReserveDirectAddress
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanGetKeyInformations" | tee log/CanGetKeyInformations
dotnet test --filter "FullyQualifiedName=NBXplorer.Tests.UnitTest1.CanTrackDirect" | tee log/CanTrackDirect
```

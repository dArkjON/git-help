# Chapter 3

## Solution and Technical Specification

Bitcore comes with key innovations that render it particularly well-suited as a day-to-day means of payment both in personal and business contexts. Each of these innovations, as well as their role in Bitcore’s increased efficiency and usability, will be detailed in this section.

For a quick overview, the key technical specifications of Bitcore are summarized below:

**Name Bitcore**

**Ticker BTX**

* Launched April 24, 2017
* Max supply of 21 million coins
* Blocksize 10MB (20MB SegWit)
* 2.5 min average blocktime
* Current blockchain size approximately 950 MB
* Timetravel10 (GPU) mining algorithm
* SegWit and Bloom online
* Smooth diff64_15 difficulty retargeting algorithm
* Fair distribution: BTC claiming and airdrops

> “[Bitcore] innovates by cleaning things up”
> *-- Jimmy Song (vii), Bitcoin Core Developer*

![Figure 1: Bitcoin, Bitcoin Cash, Bitcoin Gold and Bitcore - comparison chart.](https://bitcore.cc/wp-content/uploads/2018/06/timeline014.png)

## 3.1 Coin Supply
The maximum number of coins that will be produced on the Bitcore platform is fixed at 21 million. This number was chosen deliberately to match the total supply of coins on the Bitcoin protocol at the moment.

This limited coin supply is the result of Bitcoin’s halving algorithm that reduces the coinbase reward for miners by 50% every 210,000 blocks, reducing the number of newly mined coins about every four years, until it reaches approximately zero in the year 2140.

Bitcore’s block reward was identical to the Bitcoin block reward for the first 10,000 blocks: 12.5 BTX per block, with a block time of 10 minutes. Subsequently, an update decreased the reward to 3.125 BTX per block with an average block time of 2.5 minutes.

Bitcore applies the same halving algorithm to its coinbase rewards, but in intervals of 840,000 blocks. Thus, the Bitcore supply is limited in the same way as the Bitcoin supply.

The chart below shows Bitcore’s block reward halving:

![Figure 2: Block reward halving over time for Bitcore](https://bitcore.cc/wp-content/uploads/2018/06/timeline014.png)

This halving of the reward in fixed intervals of blocks leads to a pre-determined final number of coins, a concept named controlled supply.

## 3.2 Blockchain and Algorithms
Bitcore uses a proof-of-work algorithm just like Bitcoin’s. However, the adjustment of difficulty is solved in an innovative manner, by employing the Core Shield 64_15 difficulty retargeting algorithm as described below.

Another crucial difference to Bitcoin are Bitcoin’s reduced block times, a quarter of Bitcoin’s block times, which are making Bitcore both more usable and more secure, as detailed further below in this section. At the same time, the block size is significantly larger, again contributing to higher transaction speed and better usability.

Finally, the activation of SegWit – 4.5 months earlier than on the Bitcoin blockchain – and Lightning Network compatibility make Bitcore a means of payment ideally suited to the needs of tomorrow’s individuals and businesses.

### 3.2.1 Difficulty Retargeting with Core Shield 64_15
In cryptocurrencies based on proof-of-work, difficulty retargeting – in other words, adjusting the difficulty with which miners may find the next block – serves the purpose of ensuring consistent block times. Without difficulty retargeting, block times would decrease with increasing number of miners active on the blockchain at a given time as this would increase the likelihood that the correct hashing value is discovered by any among this large number of miners.

Therefore, in difficulty retargeting, the difficulty level of discovering the next block is raised when many miners are active on the protocol, and is decreased when fewer miners are active.

In Bitcoin, the difficulty level is adjusted every 2016 blocks. With a block time of approximately 10 minutes, this is equivalent to an adjustment about once every two weeks – a rather sluggish rate that is not responsive to short-term increases or decreases in mining activity. Such short-term mining activity fluctuations, however, are frequently observed when miners switch back and forth between Bitcoin and its forks, looking for the best ratio between mining effort (determined by difficulty) and reward.

In order to solve this challenge, Bitcore has replaced Bitcoin’s difficulty retargeting method with a novel algorithm, named Core Shield 64_15.

In Core Shield 64_15, the block difficulty is re-adjusted every 64 blocks. With a Bitcore block time of only 2.5 minutes, difficulty readjustment is performed every 2 hours and 40 minutes. This makes Bitcore’s block difficulty more responsive than Bitcoin’s, but at the same time, overly turbulent short-term adjustments are avoided: The difficulty will not be changed by more than 15% in each re-adjustment, leading to gradual rather than dramatic changes.

Bitcore’s difficulty retargeting algorithm is therefore not only more efficient, but leads to more predictable block times and further secures the network against double-spending attacks that are more likely to succeed in times of disproportionately low hashing difficulty.

![Figure 3: Difficulty retargeting in Bitcore (sample data from May 2018).](https://bitcore.cc/wp-content/uploads/2018/06/timeline014.png)

### 3.2.2 Shorter Block Times
Bitcore’s protocol is designed to yield a block time of 2.5 minutes – a quarter of Bitcoin’s 10 minute block times.

Shorter block times are advantageous for a number of different reasons.

The first is that they allow for faster confirmations. Every transaction on the blockchain starts its existence as an unconfirmed transaction, which will eventually picked up by miners competing to create the next block. Every time a valid block is created on the blockchain, the transactions it contains are considered to be confirmed.

As several current valid blocks with different confirmed transactions may exist on the blockchain in parallel, only the creation of further blocks following the current block proves that a transaction has actually become part of the active chain, i.e., the longest currently existing chain. This policy is part of the proof-of-work consensus mechanism to impede double-spending attacks by malicious nodes: The amount of work (and thus energy) to create a single block with a fraudulent transaction may still be manageable for an attacker. However, this fraudulent transaction will not be part of the active blockchain in the long run unless the attacker can spend even significantly more work to create a sufficient number of blocks afterwards in order for this chain to become the longest chain.

For this reason, many merchants and other entities accepting crypto payments will wait for more than one valid block until they accept a certain transaction as confirmed. In general, payments of larger sums run a higher risk of being falsified, and thus require longer confirmation times in order for the merchant to be safe.

Block times of 10 minutes have originally been chosen by Satoshi Nakamoto to secure the Bitcoin network in its size of almost 10 years ago. Since then, the network has grown considerably, making it more difficult for malicious actors to introduce fraudulent transactions into the network.

Vitalik Buterin, founder of Ethereum, argues that that shorter block times are preferable over longer ones (viii) because they provide a higher granularity of information: Correct active chains will more quickly be detected and preferred over incorrect chains, and an acceptable security level for small- to medium-sized transactions will be achieved sooner. However, the shortening of block times does increase the centralization risk of proof-of-work-based blockchains, giving larger players considerably more power to possibly cheat the network. Thus, block times cannot be arbitrarily reduced, but must be carefully designed keeping these conflicting tendencies in mind.

In the light of all these considerations, Bitcore has decided to fully enjoy the privilege and benefits that come with modestly reducing the overall block time to 2.5 minutes.

### 3.2.3 Larger Block Size
Bitcore’s blocks currently have a size of 10 MB, without factoring in the additional room that comes from the ‘re-weighing’ of the data due to SegWit, which increases the size to 20 MB. Therefore, Bitcore can produce 80 MB in blocks (40 MB of which are due to SegWit) in the same interval in which Bitcoin produces 2 MB (1 MB without SegWit).

Larger blocks can contain more transactions, which at a constant block time is equivalent with faster transaction throughput. Transaction throughput has always been a critical issue with regard to cryptocurrency’s ability to compete with fiat payment solutions: The incumbent VISA can handle 1,700 transactions per second (TPS), and PayPal 115 TPS at least.

With activated SegWit, Bitcoin can handle around 11 TPS, although there have been spikes as high as up to 20 TX/second for very brief periods of time.

In order to enable widespread adoption of crypto payment methods, the scalability of blockchain networks obviously needs to improve, and throughput needs to increase. Two solutions to this challenge are commonly being discussed: Increasing the block size or introducing off-chain scaling solution such as the Lightning Network.

The Bitcore community has chosen to increase the block size to 10 MB and given an average of 224 bytes/TX, the BTX chain can handle approximatively 310 TX/second. With SegWit, its potential maximum block size is increased even further, to 20 MB, and the BTX chain can handle 550 TX/second under optimal conditions, even without accounting for the fact that some of the transactions can be routed off-chain via the Lightning Network.

Bitcore has proven its capability to handle large numbers of transactions in a short interval of time when approximately 5 million transactions were processed within a few days in November 2, 2017, upon activation of the hybrid fork (see section 2.2 of the present paper).

### 3.2.4 Activation of Segregated Witness (SegWit)
Segregated Witness (SegWit) was activated on the Bitcore blockchain in April, 2017, with block #3,000 – half a year earlier than in Bitcoin. Prior to activation, Bitcore Timetravel10 miners successfully began the creation of SegWit compliant blocks.

Segwit provides several immediate benefits:
- Elimination of unwanted transaction malleability
- Capacity increase
- Weighting of data based on how it affects node performance
- Signature covering of value
- Linear scaling of sighash operations
- Increased security for multisig
- More efficient almost-full-node security
- Script versioning

### 3.2.5 Lightning Network Compatibility
The Lightning Networkix is a transfer network operating at a layer above the Bitcore blockchain. By using smart contract functionality, it enables instant payments across a network of participants, obviating the need to wait for confirmation, as described in previous sections of this whitepaper.

In addition to instant payments, the lightning network confers further advantages:
- Increased scalability as a side effect of instant payments
- Lower costs, making this solution attractive for micropayments as well
- Enabling cross-chain atomic swaps off-chain with heterogeneous blockchain consensus rules

Bitcore is fully compatible with the Lightning Network and therefore able to support instant payments as well as micropayments.

### 3.2.6 Low Fees
With an average fee of $0.0003 USD per kilobyte and a median fee of $0.0002 USD per kilobyte, Bitcore’s fees are markedly lower than the fees of other major cryptocurrencies (also see Figure 4). As 1 kilobyte is roughly equivalent to 3 transactions, this corresponds to a fee of about $0.0001 USD or 0.01 US-Cent per transaction.

This favorable fee structure further contributes to Bitcore’s suitability for everyday transactions and even micropayments.

![Figure 4: Comparison chart, Bitcore against other cryptocurrencies.](https://bitcore.cc/wp-content/uploads/2018/06/timeline014.png)

Bitcore has a required minimum fee of 0.0001 BTX per kilobyte; the recommended fee, intended to support minders, is currently (July 2018) about 0.001 BTX per kilobyte. As Bitcore blocks are currently not full, there is no advantage in transaction speed to be gained by paying a higher fee; however, this may be the case in the future as the load of the Bitcore network increases.

# Chapter 2
## From Bitcoin to Bitcore

> “A purely peer-to-peer version of electronic cash would allow online payments to be sent directly from one party to another without going through a financial institution. Digital signatures provide part of the solution, but the main benefits are lost if a trusted third party is still required to prevent double-spending. We propose a solution to the double-spending problem using a peer-to-peer network.”
*-- Satoshi Nakamoto, 2008*

It was this statement that gave birth to the modern concept of cryptocurrency and indeed decentralized finance. Until Satoshi Nakamoto designed the original Bitcoin concept, practically all of world finance relied on central authorities, or more accurately: Central points of failure. The safety of everyone’s money was contingent upon the security and economic health of the bank or financial institution in possession of the funds.

Every case of security breach, misconduct or bankruptcy in the financial world meant that those who relied on those institutions to protect their savings would potentially be left without the necessary funds.

Without needing to invent any kind of previously non-existing technology, Satoshi Nakamoto combined existing paradigms in a novel way to solve this problem: A distributed ledger secured by proof of work would henceforth provide a framework in which participants would be forced to remain honest, without intervention – and the potential of manipulation – by any kind of central authority.

The incentivized process called “mining” was and is central to the functioning of this system. A set of rules made sure that the system could essentially operate autonomously and sustainably without any directive from “leaders” or indeed any kind of individual or single entity. This was done on purpose in order to maintain the principle of decentralization: If any one company were responsible for ensuring a smooth operation of the system, then that entity would represent a potential single point of failure – which would defeat the purpose of the protocol.

In this whitepaper, we will take a closer look at the features of the original Bitcoin protocol – and the ways in which Bitcore has preserved as well as advanced and improved Bitcoin’s original characteristics.

This will serve to demonstrate why and how the Bitcore protocol is a powerful alternative cryptocurrency to help facilitate some of the use cases for cryptocurrency that have not yet been attainable by currently existing crypto technology.

## 2.1 Bitcore as Open Source
Both Bitcoin and Bitcore are genuinely open source endeavours. The Bitcore community feels that this is in accordance with the decentralized, participative and community-focused spirit of Bitcore.

In particular, the development of Bitcore was only possible because of Bitcoin’s compliance with the following characteristics of open source, as stipulated by The Open Source Initiativev - and in turn, the Bitcore codebase is subject to the same conditions and degrees of freedom:

1. Free Redistribution
2. Inclusion of source code
3. Permission of derived works and modifications and their distribution
4. Integrity of author’s source code
5. No discrimination against persons or groups
6. No discrimination against fields of endeavor
7. Applicability of license without need for execution of another license
8. License not specific to a product
9. No restrictions of other software through license
10. Technology neutrality of license
By adhering to these standards of open source software, Bitcore enables the open source community to access, modify and further develop its code, without any discrimination regarding identity, background, intention or industry.

## 2.2 Distribution: One-to-One Claiming, Hybrid Fork and Airdrop
Classical Bitcoin forks copy the Bitcoin blockchain at a specific block and piont in time. Bitcore, however, has created a new coin with an empty blockchain, with the explicit purpose of separating Bitcore from Bitcoin and establishing it as a separate entity.

16.2 million Bitcore coins (BTX) were pre-mined (equivalent to the number of existing Bitcoin at the moment of Bitcore blockchain creation) and thus ready for community distribution.

The distribution of BTX to its prospective user community took place in three phases:
- One-to-one claiming
- Hybrid fork
- Airdrop

### 2.2.1 One-to-One Claiming
During the first six months of Bitcore’s existence, from April 2017 to November 2017, Bitcoin users were able to exchange their Bitcoin (BTC) to Bitcore (BTX) in a 1:1 ratio.

This exchange was implemented using a database and Bitcoin’s signmessage functionvi.

Of 16.2 million pre-mined BTX, 590,000 were claimed in this first distribution step. The opportunity for 1:1 claiming ended on November 2, 2017.

### 2.2.2 Hybrid Fork
On November 2, 2017, at block height #492,820 of the Bitcoin protocol, a snapshot of the Bitcoin blockchain was taken. The distribution of the remaining 15.8 million pre-mined BTX continued in a manner different from the 1:1 claiming in the first phase.

All addresses on the Bitcore blockchain whose corresponding addresses on the Bitcoin Blockchain were holding funds of at least 0.01 BTC were filled with the amount of 50% in BTX, relative to the amount of BTC held in the respective address. The funding ratio, in other words, was 0.5 BTX to 1.0 BTC.

In the following days, approximately 5 million transactions were processed, and roughly 8 million BTX distributed among all eligible addresses. This was not only a practical way to distribute BTX, but has also served to demonstrate that the BTX blockchain is capable of processing a large number of transactions in a relatively short amount of time.

Thus, about 8 million of the initial 16 million pre-mined BTX were distributed to the community. Of the remaining 8 million, 10% were stored by the Bitcore team for the purposes of future technical development.

### 2.2.3 Airdrop
90% of the remaining 8 million BTX were finally distributed in a series of weekly airdrops, according to a differential schedule.

In the initial airdrop, a 25% bonus of the user’s BTX wallet balance was distributed. Consequently, further airdrops were conducted according to the following schedule (with percentage of user’s wallet balance):

- +5% every Monday in January 2018
- +6% every Monday in February 2018
- +7% every Monday in March 2018
- +8% every Monday in April 2018
- +9% every Monday in May 2018

With this last phase, the distribution of pre-mined BTX was completed.

### 2.2.4 Airdrop Example
An example will further illustrate the process:

Alice is holding 20 Bitcore (BTX) in her wallet. She has registered her wallet for an airdrop in January, when the bonus percentage was 5%. She is therefore eligible to receive 5% of her total BTX balance in January’s airdrop:

```quote
20 BTX * 5% = 1 BTX
```
Thus, Alice receives one additional BTX coin and carries a total of 21 BTX in her wallet after the January airdrop.

### 2.2.5 Why Hybrid Fork and Airdrop?
The crucial difference between this model and the typical hard fork model in other models is the following: Rather than distributing an identical number of all the outstanding coins that had been issued on the blockchain at the moment of the snapshot, only 50% of BTX coins were distributed in this manner. The resulting 50% were distributed to active BTX users only. This way, the Bitcore team made sure that passive holders of massive amounts of Bitcoin, so-called whales, would not automatically become „Bitcore whales“ as well, and thus skew the balance of power within the Bitcore community, as well as limit the circulating supply of Bitcore in a way that would hurt future operations of the ecosystem. Instead, the Bitcore team managed to achieve a more equal distribution of coins than previous Bitcoin forks, in accordance with the decentralized and participative ideals of the Bitcore community.

## 2.3 No ICO
As a hybrid fork, Bitcore’s launch was not designed as or funded by an initial coin offering (ICO).

This was a conscious decision by the Bitcore community intended to foster equal opportunities and participation among potential BTX users around the world. As trends and developments in the crypto sphere have shown over the past years, ICOs attract speculators, thus increasing volatility of the underlying cryptocurrency, and diminishing its everyday usefulness. Furthermore, ICOs lead to an influx of wealthy private investors who „buy“ their way into disproportionate power and influence over crypto communities. Last but not least, different regulatory frameworks apply to ICOs whose teams are based in different countries, and many of them explicitly preclude citizens of certain countries from participating in ICOs.

These arbitrary limitations are not acceptable to the Bitcore community. We strive to create a useful crypto ecosystem that is equally accessible to anyone interested, regardless of location and nationality.

In order to be as independent from local regulations as practically possible, we have chosen to operate as a non-profit consortium of interested individuals. Membership in the founding team and participation in the Bitcore community are solely dependent on individual levels of skill, interest and commitment, not arbitrary geographical borders.

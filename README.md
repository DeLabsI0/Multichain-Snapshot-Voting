# coinslist

a camelcorn production


Multichain Snapshot
We attempted to build a multi-chain governance tool that integrates with Snapshot (that would work with DAOs)

Description
Decentralized Autonomous Organizations (DAOs) are quickly becoming the future of companies. They are now facing two problems. First, these DAOs originally lived just on the Ethereum blockchain. While Ethereum is powerful, many DAOs are launching on multiple chains including Polygon and Binance Smart Chain. Right now there is no easy system to count votes across multiple chains. The second problem is that they are  This limits the growth of DAOs 

That is what we are building. A tool to.

Multichain Snapshot showcase

How it's made
We used Snapshot, Truffle, and Solidity. We wrote our smart contract in solidity and then tested in truffle, which we also used to deploy. We then linked the deployed truffle contract addresses on both testnets and mainnet to wire our Snapshot page for voting.

We used etherscan/bscscan to look at both ETH and BSC blockchains in order to verify that our smart contract was deployed. Our project is still a work in progress because as noobs in crypto, we took a little long to understand the underpinnings of the ecosystem. If we had more time, we would have properly tested our contract (there are some errors now) and wired it up with our snapshot page to actually count the votes (and tested this as well!)

Technologies used

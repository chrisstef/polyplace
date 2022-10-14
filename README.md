<p align="center">
<img src="/assets/logo02.png" alt="Alt text logo" title="Logo" width="80px" height="80px">
</p>

# Polyplace

An open decentralized NFT Marketplace built with Solidity and Next.js, powered by Polygon Technologies. It basically is an open platform where users can mint and trade their own NFTs.


## Table of Contents

- [The Project](#the-project)
- [Developers](#developers)
- [Resources](#resources)


## The Project

An open platform where users can mint their own NFTs and list them on a Marketplace or buy NFT from others. It includes:

- A smart contract which represents a collection of NFTs by following the ERC-721 standard.
- A smart contract which represents the NFT Marketplace and contains all the logic to make offers, execute offers...
- A Next.js front-end application as a user interface.

`NFTMarketplace` Polygon(Mumbai Testnet) smart contract address:

https://mumbai.polygonscan.com/address/0xF5f6B924332C350E3Fcd3A50Fc94db822f0B760f

### Demo video

https://www.youtube.com/watch?v=kVIb7MGJ53k&t=36s

### Project details

Users can access the application via web-browser, and must have the Metamask wallet installed. The interface, built with Next.js, relies on the ethers.js library to communicate with the smart contracts through Metamask. This means that the data reflected on the front-end application is fetched from the Polygon blockchain. Each action performed by the user (mint an NFT, sell NFT, buy NFT...) creates a transaction on Polygon, which will requires Metamask confirmation and a small fee, and this transaction will permanently modify the state of the NFTMarketplace smart contracts. On top of it, user's NFT Metadata will be uploaded to the IPFS, generating a hash which will be permanently recorded on the blockchain to prove ownership.

### Features

Users can perform the following actions on the NFT Marketplace:

#### Mint

Input a name, description and upload a file (image) to mint an NFT. Once minted, a representation of this NFT will be displayed in the marketplace and it will be owned by its creator. This is open for everyone, meaning everyone can participate in this NFT creation through this platform. 

#### Buy NFT

A user can buy NFTs which someone else offered. This will require paying the requested price and a small fee.

#### Sell NFT

Users can sell their NFT by specifying its price (in MATIC). If someone fulfills this offer, then the NFT and it's ownership is transferred to the new owner. 

### Connect to Mumbai Testnet

First of all, it is required to install Metamask wallet browser extension: https://metamask.io/

Then you should configure Metamask to connect to your local blockchain. To do it manually:
- Open Metamask.
- Open the Network Configuration panel.
- Open Custom RPC.
- Connect to Mumbai Testnet.

Another way to connect to Mumbai Testnet is by using the following link: https://chainlist.org/ and add the network of your choice by simply connecting your wallet.

### Getting test MATIC

You can get up to 2 MATIC/day by pasting your address here: https://mumbaifaucet.com/.


## Developers

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### The repository

First, you will need to `clone` or `fork` the repository into your Github account:

```
git clone https://github.com/chrisstef/polyplace.git
```

### Installing

First, you will need to install the dependencies.

Run the following command in your terminal after cloning the main repo:

```
npm install
```

Then, you will need to install hardhat globally by running the following command into your terminal:

```
npm install -g hardhat
```

### Smart Contract

First, you will have to set up a local network by running the following command:

```
npx hardhat node
```

Afterwards, compile the smart contracts by running the following command in your terminal:

```
npx hardhat compile
```

### Smart Contract Visualization

Below you can view the smart contract functions (and it's interactions).

<p align="center">
<img src="/assets/NftViz.png" alt="SCV" title="Smart Contract Visualization">
</p>

### Deployment on Local Blockchain

Deploy the contracts on your hardhat local network by running the following command:

```
npx hardhat run scripts/deploy.js --network hardhat
```

Paste the deployed address in the `constants.js` file.

Remove the argument provided in the JsonRpcProvider which is located in the line 111 of the `NFTContext.js` file.

Finally, run the following command in your terminal to open the User Interface:

```
npm run dev
```

An instance of Polyplace will be up and running on your local environment.

### Technology stack

- `Solidity`
- `Next.js`
- `hardhat`
- `ethers.js`
- `node.js`
- `Metamask`
- `IPFS`
- `Infura`
- `Alchemy`

### Future Ideas

- Clear deploy on Polygon Mainnet. 
- Auction features.
- Bulk upload of NFTs as collections.
- Creator details and more.


## Resources

- [polygon.technology](https://polygon.technology/)
- [Solidity](https://docs.soliditylang.org/en/v0.8.15/)
- [node.js](https://nodejs.org/)
- [ethers.js](https://docs.ethers.io/v5/)
- [next.js](https://nextjs.org/)
- [IPFS](https://ipfs.io/)
- [Infura](https://infura.io/)
- [Alchemy](https://www.alchemy.com/)
- [Vercel](https://vercel.com/docs)

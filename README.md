<p align="center">
<img src="/assets/logo02.png" alt="Alt text logo" title="Logo" width="100px" height="100px">
</p>

# Polyplace

An open decentralized NFT Marketplace built with Solidity and Next.js, powered by Polygon Technologies. It basically is an open platform where users can mint and trade their own NFTs.

The smart contract has been deployed in the following (test) network: Mumbai.

`NFTMarketplace` Smart Contract Address:

https://mumbai.polygonscan.com/address/0xC9798FF24bEa832c70E66554a35211677D64a627

## Table of Contents

- [The Project](#the-project)
- [Getting Started](#getting-started)
- [Resources](#resources)

## The Project

An open platform where users can mint their own NFTs and list them on a marketplace or buying NFT from others. It includes:

- A smart contract which represents a collection of NFTs by following the ERC-721 standard.
- A smart contract which represents the NFT Marketplace and contains all the logic to make offers, execute offers...
- A Next.js front-end application as a user interface.

### Project architecture

Users can access the application via web-browser, and must have the Metamask wallet installed. The interface, built with Next.js, relies on the ethers.js library to communicate with the smart contracts through Metamask. This means that the data reflected on the front-end application is fetched from the Polygon blockchain. Each action performed by the user (mint a NFT, sell NFT, buy NFT...) creates a transaction on Polygon, which will require Metamask confirmation and pay a small fee, and this transaction will permanently modify the state of the NFTMarketplace smart contracts. On top of it, users NFT Metadata will be uploaded to the IPFS, generating a hash which will be permanently recorded on the blockchain to prove ownership.

### Features

Users can perform the following actions on the NFT Marketplace:

#### Mint

Input a name, description and upload a file (image) to mint an NFT. Once minted, a representation of this NFT will be displayed in the marketplace and it will be owned by its creator. This is open for everyone, meaning everyone can participate in this NFT creation within this platform. 

#### Buy NFT

A user can buy NFTs which someone else offered. This will require paying the requested price.

#### Sell NFT

A user can sell his NFT by specifying its price (in Matic). If someone fulfills this offer, then the NFT and it's ownership is transferred to the new owner. 


## Getting Started

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

Then, you will need to install hardhat globally by running the following command int your terminal:

```
npm install -g hardhat
```

### Smart Contracts

First, you will have to set up a local network by running the following command:

```
npx hardhat node
```

Then, you will have to compile the smart contracts by running the following command in your terminal:

```
npx hardhat compile
```

### Deployment on Local Blockchain

Deploy the contracts on your hardhat local blockchain by running the following command:

```
npx hardhat run scripts/deploy.js --network hardhat
```

### Opening the User Interface

First of all, it is required to install Metamask wallet as a browser extension: https://metamask.io/

Then you should configure Metamask to connect to your local blockchain. This requires the following:
- Open Metamask.
- Open the Network Configuration panel.
- Open Custom RPC.
- Connect to Matic Mumbai Testnet.

Finally you just need to run the following command in your terminal to open the User Interface:

```
npm run dev
```

### Smart Contract Visualization

<p align="center">
<img src="/assets/logo02.png" alt="SCV" title="Smart Contract Visualization">
</p>


### Technology stack

- `Solidity`
- `Next.js`
- `hardhat`
- `ethers.js`
- `node.js`
- `Metamask`
- `IPFS`


## Resources

- [polygon.technology](https://polygon.technology/)
- [Solidity](https://docs.soliditylang.org/en/v0.8.15/)
- [node.js](https://nodejs.org/)
- [ethers.js](https://docs.ethers.io/v5/)
- [next.js](https://nextjs.org/)
- [IPFS](https://ipfs.io/)
- [Vercel](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme)

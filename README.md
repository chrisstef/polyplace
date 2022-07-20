

# Polyplace

This is an open decentralized NFT Marketplace built with Solidity and Next.js, powered by Polygon. It basically is an open platform where users can mint their own NFTs and expose it on the marketplace.

## Table of Contents

- [Getting Started](#getting-started)
- [The Project](#the-project)
- [Resources](#resources)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### The repository

First, you will need to `clone` or `fork` the repository into your Github account:

```
git clone https://github.com/chrisstef/polyplace.git
```

### Installing

First, you will need to install the dependencies with: `npm install`.

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
npm hardhat node
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

Then you should configure Metamask to connect to your local blockchain run by Ganache. This requires the following:
- Open Metamask
- Open the Network Configuration panel
- Open Custom RPC
- Conect to Matic Mumbai Testnet.

Finally you just need to run the following command in your terminal to open the User Interface:

```
$ npm run dev
```

### Technology stack

- `Solidity`
- `Next.js`
- `hardhat`
- `ethers.js`
- `Node.js`
- `Metamask`
- `IPFS`

## The Project

An open platform where users can mint their own NFT and expose it on a marketplace by making an offer or buying NFT from others. It includes:

- A smart contract which represents a collection of NFTs by following the ERC-721 standard.
- A smart contract which represents the NFT Marketplace and contains all the logic to make offers, execute offers...
- A Next.js front-end application as a user interface.

### Project architecture

The user can access the application via web-browser, and he must have the Metamask wallet installed. This interface, built with Next.js, relies on the ethers.js library to communicate with the smart contracts through Metamask. This means that the data reflected on the front-end application is fetched from the Polygon blockchain. Each action performed by the user (mint a NFT, sell NFT, buy NFT...) creates a transaction on Polygon, which will require Metamask confirmation and pay a small fee, and this transaction will permanently modify the state of the NFTMarketplace smart contracts. On top of it, the user will upload the NFT Metadata to the IPFS, creating a permanent hash which will be permanently recorded on the blockchain itself to prove ownership.

### NFT Marketplace features

The user can perform the following actions on this NFT Marketplace:

#### Mint

The user must input a name, description and upload a file (image) to mint his own NFT. Once minted, a representation of this NFT will be displayed in the marketplace and initially it will be owned by its creator. This is open for everyone, meaning everyone can participate in this NFT creation within this platform. 

#### Buy NFT

A user can buy those NFT which someone else offered. This will require paying the requested price.

#### Sell NFT

The user can sell his NFT by specifying its price (in Matic). If someone fulfills this offer, then the NFT and it's ownership is transferred to a new owner. 

## Resources

- [polygon.technology](https://polygon.technology/)
- [solidity](https://docs.soliditylang.org/en/v0.8.15/)
- [node.js](https://nodejs.org/)
- [ethers.js](https://docs.ethers.io/v5/)
- [next.js](https://nextjs.org/)
- [IPFS](https://ipfs.io/)

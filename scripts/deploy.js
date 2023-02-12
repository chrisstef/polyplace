
const hre = require('hardhat');

async function main() {
  const NFTMarketplace = await hre.ethers.getContractFactory('NFTMarketplace');
  const nftMarketplace = await NFTMarketplace.deploy();

  await nftMarketplace.deployed();

  console.log('NFTMarketplace deployed to:', nftMarketplace.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

/*
CODE EXPLANATION: 
This script deploys a contract named "NFTMarketplace" using the Hardhat environment. The deployed contract's address is logged in the console. 
In case of an error during deployment, an error message is logged in the console and the script exits with a status code of 1.
*/

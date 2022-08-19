const { ethers } = require("hardhat");

async function main(){
  console.log("Deploying BlockchainComplex Contract...");
  const BlockchainComplex = await ethers.getContractFactory("BlockchainComplex");
  const blockchaincomplex = await BlockchainComplex.deploy();
  await blockchaincomplex.deployed();
  console.log("BlockchainComplex deployed at : ",blockchaincomplex.address);
}

main();
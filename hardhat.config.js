require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("@nomiclabs/hardhat-etherscan");
module.exports = {
  solidity : "0.8.15",
  networks: {
    hardhat : {},
    goerli : {
      url:`https://eth-goerli.alchemyapi.io/v2/${process.env.ALCHEMY_API_URL}`,
      accounts:[`${process.env.PRIVATE_KEY}`]
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
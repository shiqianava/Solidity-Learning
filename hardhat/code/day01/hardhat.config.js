// Ethers.js 这是一个与以太坊交互的JavaScript库。
// 和 Waffle 在其之上构建的一个简单的智能合约测试库。
// 不需要 require("@nomiclabs/hardhat-ethers")，因为 hard-waffle 已经做到了
require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.10",
};

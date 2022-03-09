const { ether, ethers } = require('hardhat')

const main = async () => {
    // 部署方法和之前测试完全一样
    const HelloWorld = await ethers.getContractFactory('HelloWorld')
    const hw = await HelloWorld.deploy('HelloWorld')
    await hw.deployed()

    console.log('合约部署成功，地址:', hw.address)
}

main()
    .then(() => process.exit(0))
    .catch( error => {
        console.error(error)
        process.exit(1)
    })
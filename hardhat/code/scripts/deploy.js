// ethers变量在全局作用域可用。 如果你喜欢代码显示表达，你可以在顶部添加这一行
// 在用node运行脚本之前，你需要声明ethers。 这是需要的，因为Hardhat不会像调用run任务时那样在全局范围内注入它。
// 直接 node scripts/sample-script.js
// 启动本地节点

// npx hardhat node

// 打开一个新的终端，在localhost网络中部署智能合约

// npx hardhat run --network localhost scripts/deploy.js
const { ether, ethers } = require('hardhat')

const main = async () => {
    // 部署方法和之前测试完全一样
    const a = await ethers.getContractFactory('Counter')
    const b = await a.deploy(1)
    await b.deployed()
    const count = await b.get()
    console.log('合约部署成功，地址:%s，%d', b.address, count)
}

main()
    .then(() => process.exit(0))
    .catch( error => {
        console.error(error)
        process.exit(1)
    })
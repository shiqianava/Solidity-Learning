const { expect } = require('chai')
// ethers变量在全局作用域可用。 如果你喜欢代码显示表达，你可以在顶部添加这一行
// const { ethers } = require("hardhat");

describe('加减合约测试', function () {
    it('测试输出 2', async () => {
        const a = await ethers.getContractFactory('Counter')
        const b = await a.deploy(1)
        // 等待合约部署完毕
        await b.deployed()
        // hw可以调用合约的成员方法，上面这一系列操作非常类似标准OOP中的实例化操作
        expect(await b.get()).to.equal(1)

        await b.inc()
        await b.inc()
        await b.dec()
        expect(await b.get()).to.equal(2)
    })
})
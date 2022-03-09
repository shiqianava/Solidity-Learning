const { expect } = require('chai')
const { ethers } = require('hardhat')

describe('合约基础测试', function () {
    it('调用say方法，日志应该输出"Hello World!"', async () => {
        // 返回一个HelloWorld合约的工厂promise
        const HelloWorld = await ethers.getContractFactory('HelloWorld')
        // 开始部署合约并且返回实例化出来的合约对象的promise
        const hw = await HelloWorld.deploy('Hello, world!')
        // 等待合约部署完毕
        await hw.deployed()
        // hw可以调用合约的成员方法，上面这一系列操作非常类似标准OOP中的实例化操作
        expect(await hw.say()).to.equal('Hello, world!')
    })
})
const { expect } = require('chai')
// ethers变量在全局作用域可用。 如果你喜欢代码显示表达，你可以在顶部添加这一行
// const { ethers } = require("hardhat");

describe('数组合约测试', function () {
    it('输出数组 ', async () => {
        const a = await ethers.getContractFactory('DataLocations')
        const b = await a.deploy([1, 2, 3], '0x52612988c493B592aF0E50379E88778a078D1724', 996)
        // 等待合约部署完毕
        await b.deployed()
        console.log(b.arr)
        console.log(b.map)
        console.log(b.myStructs)
        // hw可以调用合约的成员方法，上面这一系列操作非常类似标准OOP中的实例化操作
        // expect(await b.push(3)).to.equal(1)
    })
})
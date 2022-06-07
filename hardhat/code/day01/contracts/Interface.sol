// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint public count;
    function increment() external {
        count += 1;
    }
}

// 继承了该接口的合约，必须实现count()和increment()两个函数
// 一个用来返回count值，一个用来做加法运算
interface ICounter {
    function count() external view returns (uint);

    function increment() external;
}

contract MyCounter {
    // ICounter接口的应用，猜测：该地址某类token增加？
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    // 获取该地址某token数量
    function getCount(address _counter) external view returns (uint) {
        ICounter(_counter).count();
    }
}

// Uniswap example
interface UniswapV2Factory {
    function getPair();
}
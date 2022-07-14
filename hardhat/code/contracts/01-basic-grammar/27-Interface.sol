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
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}
interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReverse() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reverse0, uint reverse1, ) = UniswapV2Pair(pair).getReserves();
        return (reverse0, reverse1);
    }
}
//SPDX-License-Identifier: MIT
// software package data exchange: 麻省理工学院 许可证
pragma solidity ^0.8.10;

/* 
Gas Saving Techniques 节省gas的技术
# 使用 calldata 代替 memory (只能在external修饰的函数中使用)
# 加载状态变量 state variable 到 memory
# 用 ++i 代替for循环 i++
# 缓存数组元素
# Short ciruit 短路
*/

// gas golf
contract GasGolf {
    // start - 50908 gas
    // use calldata - 49163 gas
    // load state variables to memory - 48952 gas
    // short circuit - 48634 gas
    // loop increments - 48244 gas
    // cache array length - 48209 gas 
    // load array elements to memory - 48047 gas
    // uncheck i overflow/underflow - 47309 gas

    uint public total;

    // start - 没有优化gas的情况
    // 传入数组，统计其中大于和小于99的数字的数量
    function sunIfEvenAndLessThan99(uint[] memory nums) external {
        for(uint i = 0)
    }
}
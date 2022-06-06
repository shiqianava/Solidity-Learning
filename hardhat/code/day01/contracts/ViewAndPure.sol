// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
函数修饰符-view
* 表示一个函数不能修改状态，view 和 constant 等价，constant 在0.5版本后会弃用
* 本地执行不消耗 gas
* 下面几种情况认为是修改了状态：
    1.写状态变量  2.触发事件（events）  3.创建其他的合约  4.call调用附加了以太币
    5.调用了任何没有view或pure修饰的函数 6.使用了低级别的调用（low-level calls）
*/
/*
函数修饰符-pure
* 表示一个函数不读取状态，也不修改状态
* 下面几种情况认为是读取了状态：
    1.读状态变量  2.访问了.balance属性  
    3.访问了block、tx、msg成员（msg.sig 和 msg.data除外）
    4.调用了任何没有pure修饰的函数
*/

contract ViewAndPure {
    uint x = 1;

    // Promise not to modify the state 
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Promise not to modify or read from the state
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
事件 允许记录到以太坊区块链。事件的一些使用情况如下：
1. 监听事件并更新用户界面
2. 一种便宜的存储方式
*/

contract Event {
    // 事件声明
    // 最多可索引三个参数
    // 索引参数可以帮助你通过索引过滤日志
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
构造函数 是在合约创建时执行的可选函数
这有一个例子，怎样向构造函数传递参数
*/

// 基础合约 X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}
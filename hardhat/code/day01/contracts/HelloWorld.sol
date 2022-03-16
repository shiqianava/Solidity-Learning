// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import 'hardhat/console.sol';

contract HelloWorld {
    string public message;

    // memory 关键字表示临时存储，不持久化保存数据（对应storage关键字）
    constructor(string memory _message) {
        message = _message;
    }

    // view代表只读不可修改
    function say() public view  returns (string memory) { 
        console.log('Hello World!');
        return message;
    }
}

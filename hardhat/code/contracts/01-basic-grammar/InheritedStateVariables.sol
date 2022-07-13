// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
覆盖继承的状态变量
和函数不一样，状态变量不能通过在子合约中再次声明的方式，被重写
让我们学习怎样正确的重写继承的状态变量
*/
contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Solidity 0.6 状态变量覆盖是不允许的，会不能编译
// contract B is A {
//     string public name = "Contract B";
// }

contract C is A {
    // 通过构造函数，这是重写状态变量正确的方式
    constructor() {
        name = "Contract C";
    }

    // C.getName() 返回 "Contract C"
}
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
// 基础合约 Y
contract Y {
    string public text;
    constructor(string memory _text) {
        text = _text;
    }
}

contract A is X("Input to X"), Y("Input to Y") {
    
}

contract B is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) { }
}

contract C is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}
// 父合约参数初始化顺序可以和继承顺序不一样
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}


contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
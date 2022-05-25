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
<<<<<<< HEAD

contract Y {
    string public text;
=======
// 基础合约 Y
contract Y {
    string public text;

>>>>>>> 21abba248ae590f174a7b822cf5a398289fcd77c
    constructor(string memory _text) {
        text = _text;
    }
}
<<<<<<< HEAD

contract A is X("Input to X"), Y("Input to Y") {
    
}

contract B is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) { }
}

contract C is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

contract D is X, Y {
=======
// 有两种方法初始化父合约的参数
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}
// 父合约参数初始化顺序可以和继承顺序不一样
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}


contract E is X, Y {
>>>>>>> 21abba248ae590f174a7b822cf5a398289fcd77c
    constructor() Y("Y was called") X("X was called") {}
}
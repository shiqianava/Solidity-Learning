// SPDX-License-Identifier: MIT
<<<<<<< HEAD
pragma solidity ^0.8.10;
=======
pragma solidity ^0.8.10;

/*
继承
Solidity支持多种继承。通过使用 is 关键字，合约可以继承其他的合约。
要被子合约重写的函数必须被声明为虚拟函数
要重写父函数的函数必须使用 override 关键字
继承的顺序很重要
你必须按照从'most base-like' to 'most derived'（最基础到最派生）的顺序列出父合约

继承图
    A
   / \
  B   C
 / \ /
F  D,E
*/
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    // 重写 A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// 合约可以继承多个父合约
// 当调用一个在不同父合约中定义多次的函数时，
// 父合约按从右到左深度优先的方式搜索
contract D is B, C {
    // D.foo(), 返回 "C"
    // 因为 C 是函数 foo() 最右边的父合约
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // D.foo(), 返回 "B"
    // 因为 B 是函数 foo() 最右边的父合约
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}
<<<<<<< Updated upstream
// Inheritance must be ordered from “most base-like” to “most derived”.
// 继承顺序是从最基础的到最派生的，利用 树的广度优先搜索 进行
// 在重写函数 override 时，交换A、B的顺序，因为 A 是 B 的父合约，编译时会抛出错误，如果是B、C就不会报错
=======

// Inheritance must be ordered from “most base-like” to “most derived”.
// 上面这句话代表，继承顺序，必须是由继承树的顶部往下延伸
// 比如 A 合约就是 most base-like （最基础），B 合约就是衍生合约
// 在重写函数 override 时，交换A、B的顺序，编译时会抛出错误
>>>>>>> Stashed changes
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory){
        // 沿着继承树，返回值 'A'
        return super.foo();
    }
}
>>>>>>> 21abba248ae590f174a7b822cf5a398289fcd77c

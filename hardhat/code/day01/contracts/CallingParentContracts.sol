// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 继承树
  A
 /  \
B   C
 \ /
  D
*/

contract A {
    // 这叫做事件，你可以从函数中发出事件
    // 他们可以被记录到区块链的交易日志中
    // 在以下的例子中，对跟踪函数调用非常有用
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }
    function bar() public virtual override {
      emit Log("B.bar called");
      A.bar();
    }
}

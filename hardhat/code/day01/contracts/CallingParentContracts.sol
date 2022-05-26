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
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    // Try:
    // - 调用D.foo() 检查交易日志
    //   虽然 D 继承 A, B 和 C，但只会调用C，然后调用A
    // - 调用D.bar() 检查交易日志
    //   D 调用 C，然后 B，最后 A
    //   Although super was called twice (by B and C) it only called A once.

    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}

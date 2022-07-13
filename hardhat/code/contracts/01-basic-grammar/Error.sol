// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Error
An error will undo all changes made to the state during a transaction.
You can throw an error by calling require, revert or assert.
1. require is used to validate inputs and conditions before execution.
2. revert is similar to require. See the code below for details.
3. assert is used to check for code that should never be false. Failing assertion probably means that there is bug.
*/

contract Error {
    function testRequire(uint _i) public pure {
        // Require 应该用于验证条件，例如：
        // - 输入
        // - 执行前的条件
        // - 返回调用其它函数时的值
        require(_i > 10, 'Input must be greater than 10');
    }

    function testRevert(uint _i) public pure {
        // Revert 用于复杂条件
        // 和上面的函数作用一样
        if(_i <= 10) {
            revert('Input must be greater than 10');
        }
    }

    uint public num;

    function testAssert() public view{
        // Assert 只能用于测试内部错误
        // 和检查不变量
        assert(num == 0);
    }

    // 常见的错误：账户余额不足
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}

// 另一个例子
contract Account {
    uint public balance;
    uint public constant Max_UNIT = 2**256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // 如果balance + _amount >= balance，则banlance + _amount不会溢出
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}
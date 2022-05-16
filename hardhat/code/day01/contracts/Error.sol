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
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before excution
        // - return values from calls to other function
        require(_i > 10, 'Input must be greater than 10');
    }

    function testRevert(uint _i) public pure {
        // Revert 用于复杂条件
        // 和上面的函数作用一样
        if(_i > 10) {
            revert('Input must be great');
        }
    }

    uint public num;

    function testAssert

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
    uint public
}
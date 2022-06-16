// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Try Catch
try / catch 只能从 外部函数调用 和 合约创建 中捕获错误
*/

// 外部合约使用try / catch的例子
contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my func was called";
    }
}
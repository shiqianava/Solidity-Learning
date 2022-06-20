// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Calling other contract
合约调用其他合约有两种方式。
最简单的调用办法是 A.foo(x, y, z)。
另一种方法是使用低等级函数 call，但该方法不推荐
*/
contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns(uint, uint) {
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee _callee = Callee(_addr);
        _callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint _x) public payable{
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
    }
}
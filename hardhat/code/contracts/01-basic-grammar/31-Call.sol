// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
call 是与其他合约交互的低等级函数
当你通过fallback函数发送eth时，推荐使用这种方法
然而它不是调用已存在函数的推荐方法
*/

contract Receiver {
    event Received(address caller, uint amount, string message);
    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    // 让我们假设，合约B不清楚合约A的源代码
    // 但是我们知道合约A的地址和调用的函数名和参数
    function testCallFoo(address payable _addr) public payable {
        // 地址接收eth的同时，调用foo函数
        (bool success, bytes memory data) = _addr.call{value : msg.value}(
            abi.encodeWithSignature("foo(string, uint256)", "call foo", 123)
        );
        emit Response(success, data);
    }

    // 调用不存在的函数会触发fallback函数
    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(abi.encodeWithSignature("doesNotExist()"));
        emit Response(success, data);
    }
}
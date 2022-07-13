// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
Fallback
fallback函数不能有参数和返回值
该函数被执行情况：
1. 调用不存在的函数
2. eth直接发送给一个合约，但receive()不存在，或 msg.data 不为空
当通过transfer或send调用时，fallback有2300 gas的限制
*/

contract Fallback {
    event Log(uint gas);

    // fallback必须声明为external
    fallback() external payable {
        // send / transfer 2300gas限制
        // call 所有的gas
        emit Log(gasleft());
    }

    // 检查合约余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
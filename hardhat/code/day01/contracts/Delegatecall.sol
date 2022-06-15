// SPDX-License-Indentifier: MIT
pragma solidity ^0.8.10;

/* 
Delegatecall
delegatecall 是一个低等级函数，当合约A执行 delegatecall 到合约B时，
B的代码会共用A的状态变量、msg.sender 和 msg.value，然后被执行
*/

// 首先部署该合约
contract B {
    // 状态变量布局必须和合约A一致
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num);
        )
    }
}

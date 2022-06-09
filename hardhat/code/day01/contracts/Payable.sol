// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
Payable

声明 payable 的函数和地址可以接收 eth 进入合约
函数要使用msg.value 和 callvalue()，就必须使用payable
*/

contract Payable {
    // payable 地址可以接收eth
    address payable public owner;

    // payable 合约可以接收eth
    constructor() payable {
        owner = payable(msg.sender);
    }

    // 将eth存入此合约的函数，将此函数和一些eth一起调用
    // 合约的余额将会自动更新
    function deposit() public payable {}

    // 将此函数和一些eth一起调用
    // 因为该函数没有被定义为payable，会抛出错误
    function notPayable() public {}

    // 从合约中取出所有的eth
    function withdraw() public {
        // 获取存储在合约中的eth数量
        uint amount = address(this).balance;
        
        // 发送所有的eth给owner
        // 因为owner地址被定义为payable，所以owner可以接收eth
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Fail to send Ether");
    }

    // 将eth从合约转到输入地址
    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Fail to send Ether"); 
    }

    // 函数要调用msg.value，就必须使用payable
    function sendViaTransfer(address payable _to) public payable {
        // 发送eth时，不建议使用该函数
        _to.transfer(msg.value);
    }
}
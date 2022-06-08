// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
Payable

声明 payable 的函数和地址可以接收 eth 进入合约
*/

contract Payable {
    // payable 地址可以接收eth
    address payable public owener;

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
        
    }
}
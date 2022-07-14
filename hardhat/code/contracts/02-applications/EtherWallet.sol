// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
/* 
Ether Wallet
基础钱包举例
1. 任何人都可以发送ETH
2. 只有所有者可以提取
*/

contract EtherWallet {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "");
    }
}
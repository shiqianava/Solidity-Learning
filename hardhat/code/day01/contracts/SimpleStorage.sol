// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Reading and Write to a state variable
    * To write or update a state variable you need to send a transaction.
    * On the other hand, you can read state variables, for free, without any transaction fee. 通过view关键字修饰，可以不发送交易读取状态变量
*/

contract SimpleStorage {
    // State variable to store a number
    uint public num;

    // you need to send a transaction to write to a state variables.
    function set(uint _num) public {
        num = _num;
    }

    // you can read from a state variable without sending a transaction.
    function get() public view returns (uint) {
        return num;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Contract that creates other contracts
通过其他合约创建的合约使用 new 关键字。
从0.8.0版本开始，通过指定 salt 选项，new 关键字支持create2特征，
*/

contract Car {
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _owner, string memory )
}
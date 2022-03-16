// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Constants
    * Condstants are variables that cannot be modified.
    * Their value hard coded and using constants can save gas cost. 可以节省gas
*/

contract Constants {
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
}
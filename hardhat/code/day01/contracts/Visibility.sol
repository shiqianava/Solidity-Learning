// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Visibility
函数和状态变量必须声明，是否可以被其他合约访问。
函数可以由以下几种关键字声明：
public - 任何合约都可以调用
private - 只有定义了该函数的合约可以调用
internal - 只有继承该内部函数的合约可以调用
external - 只有其他合约和账户可以调用
状态变量可以被声明为 public，private，internal，但不能是 external
*/

contract Base {
    // 私有函数只能在函数内部被调用
    // 继承该合约的合约不能调用
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public
}
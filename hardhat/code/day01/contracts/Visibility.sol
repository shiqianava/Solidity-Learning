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
    // private私有函数
    // 只能在函数内部被调用
    // 继承该合约的合约不能调用
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }
    
    // internal内部函数
    // 可以在合约内部调用
    // 可以再继承合约中调用
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // public公有函数
    // 合约内部可调用
    // 继承的合约可调用
    // 其他合约和账户可调用
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // external外部函数
    // 只能通过其他函数和合约调用
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    } 

    // 如果我们尝试在此调用外部函数，函数将不能编译
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // 状态变量
    string private privateVar = "my private variable";
    string internal internalVar= "my internal variable";
    string public publicVar = "my public variable";
    // 状态变量不能定义为external，所以这段代码不能编译
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // 继承合约不能访问私有函数和变量
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // 内部函数可以再子合约中调用
    // 子合约重写父合约函数，父合约函数必须定义为virtual
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
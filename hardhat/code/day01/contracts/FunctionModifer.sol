// SPDX-license-Identifier: MIT
pragma solidity ^0.8.10;

/*
函数修饰符 是函数调用之前或之后，运行的代码
修饰符被用于：
1. 限制访问
2. 验证输入
3. 抵御重入攻击
*/

contract FunctionModifier {
    // 我们将会使用这些变量来演示，怎样使用修饰符
    address public owner;
    uint public x = 10;
    bool public locked;
    constructor() {
        // 将交易的发送者设置为合约的所有者
        owner = msg.sender;
    }

    // 该函数修饰符是为了检查函数调用者是否为合约所有者
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // 下划线是特殊字符，只能被使用于函数修饰符内，它告诉Solidity 继续执行剩余的代码
        _;
    }
    
    //函数修饰符可以有参数输入。该函数修饰符检查传入的地址不是 0 地址
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }
}
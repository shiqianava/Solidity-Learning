// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
Variables
There are 3 types of variables in Solidity

local
    declared inside a function
    not stored on the blockchain
state
    declared outside a function
    stored on the blockchain
global 
    provides information about the blockchain
*/

contract Variables {
    // State variables are stored on the blockchain
    string public text = "hello";
    uint public num = 123;

    function doSomething() public {
        // Local variables are not saved to the blockchain.
        uint i = 456;

        // Here are some global variables
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; //address of the caller
    }
}

/*
函数修饰符-view
* 表示一个函数不能修改状态，view 和 constant 等价，constant 在0.5版本后会弃用
* 本地执行不消耗 gas
* 下面几种情况认为是修改了状态：
    1.写状态变量  2.触发事件（events）  3.创建其他的合约  4.call调用附加了以太币
    5.调用了任何没有view或pure修饰的函数 6.使用了低级别的调用（low-level calls）
*/
/*
函数修饰符-pure
* 表示一个函数不读取状态，也不修改状态
* 下面几种情况认为是读取了状态：
    1.读状态变量  2.访问了.balance属性  
    3.访问了block、tx、msg成员（msg.sig 和 msg.data除外）
    4.调用了任何没有pure修饰的函数
*/
contract User {
    // 状态变量
    uint public user_age = 12;

    // view 修饰的条件（只读取状态，但不修改状态）
    // 本地运行，不消耗gas
    function get_age() public view returns(uint) {
        return user_age;
    }

    // pure 修饰的条件（不读取且不修改任何状态）
    // 本地运行，不消耗gas
    function get_pure() public pure returns(string memory) {
        return "hello";
    }
}



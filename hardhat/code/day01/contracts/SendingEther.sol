// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
怎样发送eth到其他合约：
transfer (2300 gas, throws error)
send (2300 gas, returns bool)
call (耗费所有gas，或自己设置gas，returns bool)

怎样接收Ether：合约想要接收eth，必须有以下函数中至少一个
receive() external payable
fallback() external payable
如果 msg.data 为空，调用receive()，否则调用fallback()

应该使用哪种方法：
在2019.10后，推荐使用 call 结合“抵御重入攻击的方法”来使用
抵御重入攻击通过：
1. 在调用合约后改变所有的状态
2. 使用重入守卫的修饰符
*/

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */
    // 接收eth，msg.data必须为空
    receive() external payable {}

    // 当msg.data不为空时，调用fallback
    fallback() external payable{}
}
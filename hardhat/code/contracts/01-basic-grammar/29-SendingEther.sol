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
    // 不能使用function关键字
    receive() external payable {}

    // 当msg.data不为空，或者receive()不存在时，调用fallback
    // 不能使用function关键字
    fallback() external payable{}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    // 函数要调用msg.value，就必须使用payable
    function sendViaTransfer(address payable _to) public payable {
        // 发送eth时，不建议使用该函数
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // 返回一个bool值，表明成功或者失败
        // 不推荐使用
        bool sent = _to.send(msg.value);
        require(sent, "Fail to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // 返回的时memory类型的data数据，不能隐式转换为storage
        // 所以使用memory修饰
        // 推荐使用
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
Public: 修饰的变量和函数，合约内部函数和外部合约函数都能调用和访问， 类比C++中Class的Public属性

Private: 修饰的变量和函数，只能在其所在的合约中调用和访问，即使是其子合约也无法访问，类比C++中Class的Private属性

Internal: 和 Private类似，不过， 如果某个合约继承自其父合约，这个合约即可以访问父合约中定义的Internal函数，类比C++中Class的Protected属性

External: 与Public类似，不过这些函数只能在合约外部被调用，不能被合约内的其他函数调用，纯粹的就是定义向外开放的接口，合约内部不能使用。但是采用this指针方式可以在合约内部被调用
*/

import 'hardhat/console.sol';

contract HelloWorld {
    string public message;

    // memory 关键字表示临时存储，不持久化保存数据（对应storage关键字）
    constructor(string memory _message) {
        message = _message;
    }

    // view代表只读不可修改
    function say() public view  returns (string memory) { 
        console.log('Hello World!');
        return message;
    }
}


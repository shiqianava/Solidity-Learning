// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
/* 
Import
在solidity中，你可以导入本地和外部的文件
本地文件结构
├── Import.sol
└── Foo.sol
*/
// 从当前目录导入 Foo.sol
import "./Foo.sol";

// import {symbol1 as alias, symbol2} from "filename";
import {Unauthorized, add as func, Point} from "./Foo.sol";

contract Import {
    // 初始化Foo.sol
    Foo public foo = new Foo();
    // 测试Foo.sol获取他的名字
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}

// 也可以从github中导入，通过简单地复制url
// https://github.com/owner/repo/blob/branch/path/to/Contract.sol
//import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";
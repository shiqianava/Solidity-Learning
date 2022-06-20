// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Library
Library类似于contract，但不能声明任何状态变量，并且不能发送ETH。
如果所有的library函数都是internal，则library需要被嵌入合约。
否则，必需先部署library，然后在部署contract之前链接库
*/

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");
        return z;
    }
}

library Math {
    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (default value)
    }
}

contract TestSafeMath {
    
}
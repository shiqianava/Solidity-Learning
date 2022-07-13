// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
/* 
ABI Decode
abi.encode 将数据编码成字节。
abi.decode 将字节解码成数据。
*/

contract AbiDecode {
    struct MyStruct {
        string name;
        uint[2] nums;
    }

    // 被external修饰的函数，参数被强制设置为calldata
    function encode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
    ) returns (bytes memory) {
        abi.encode(x, addr, arr, myStruct);
    }

    function decode(bytes calldata data)
        external 
        pure
        returns (
            uint x,
            address addr,
            uint[] memory arr,
            MyStruct memory myStruct
        )
    {
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
/* 
ABI Decode
abi.encode(…) returns (bytes)：计算参数的 ABI 编码。
abi.encodePacked(…) returns (bytes)：计算参数的紧密打包编码
abi.encodeWithSelector(bytes4 selector, …) returns (bytes)： 计算函数选择器和参数的 ABI 编码
abi.encodeWithSignature(string signature, …) returns (bytes): 等价于* abi.encodeWithSelector(bytes4(keccak256(signature), …)

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
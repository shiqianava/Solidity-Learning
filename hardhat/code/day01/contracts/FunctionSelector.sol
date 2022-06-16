// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Function Selector
当一个函数被调用时，calldata 的前4个字节指定要调用那个函数。
这4个字节被称为 function selector。
举个例子，以下代码。使用 call函数 执行 transfer函数 ，
addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))。
abi.encodeWithSignature(...) 返回数据的前4个字节，是函数选择器。
如果你事先计算并在代码中内联函数选择器，或许可以节省少量gas。
下面是函数选择器的计算方法。
*/
contract FunctionSelector {
    /*
    "transfer(address,uint256)" 
    0xa9059cbb
    "transferFrom(address,address)"
    0x23b872dd
    */
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import "hardhat/console.sol";

contract Array {
    uint[] public arr = [1, 2, 3];
    uint[] public arr2 = [1, 2, 3];

    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // Append to array 添加到数组
        // This will increase the array length by 1. 数组长度加一
        arr.push(i);
        console.log('output array after push ');
        for (uint j = 0; j < arr.length ; j++) {
            console.log(arr[j]);
        }
    }

    function pop() public {
        arr.pop();
        console.log("output array after pop ");
        for (uint j = 0; j < arr.length ; j++) {
            console.log(arr[j]);
        }
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        delete arr[index];
    }

    function example() external pure {
        // create a array in memory, only fixed size can be created.
        // 只有固定长度的数组可以在内存中创建
        uint[] memory a = new uint[](5);
    }
}
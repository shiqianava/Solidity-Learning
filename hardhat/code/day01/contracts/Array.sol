// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import "hardhat/console.sol";

// Array can have a compile-time fixed size or a dynamic size
/*
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
        // Append to array 在尾部添加到数组
        // This will increase the array length by 1. 数组长度加一
        arr.push(i);
        console.log('output array after push ');
        for (uint j = 0; j < arr.length ; j++) {
            console.log(arr[j]);
        }
    }

    function pop() public {
        // 在尾部删除一位
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
*/

// Example of removing array element
// Remove array element by shifting element from right 

contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "Index out of bound");
        for (uint i = _index; i < arr.length-1; i++) {
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}
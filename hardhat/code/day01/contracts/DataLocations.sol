// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
memory：修饰的变量的数据存储在内存中；
storage：修饰的变量的数据将永久存储在区块链上。
calldata：一般只有在外部函数（external）的参数被强制指定为calldata，这种数据位置是只读的，不会持久化到区块链中。
函数的参数，函数的返回值的默认数据位置是memory，函数内局部变量的默认数据位置为storage。状态变量的默认数据位置是storage。
memory：值传递
storage：引用传递
*/
import 'hardhat/console.sol';

contract DataLocations { 
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    // storage 存储于区块链上，如果要在参数上使用，只能在内部函数（internal）的参数上才能使用
    // memory 赋值给函数内的局部变量：在区块链中storage必须是静态分配存储空间的。函数内的局部变量虽然是一个storage的，但它仅仅是一个storage类型的指针。如果进行memory赋值给函数内的局部变量，实际会产生一个错误。
    constructor(uint[] memory _arr, address _addr, uint _foo) {
        // uint[] storage y = _arr;
        arr = _arr;
        map[1] = _addr;
        myStructs[1] = MyStruct(_foo);

        console.log(arr[0]);
        console.log(map[1]);
        console.log(myStructs[1].foo);
    }
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        // MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        // MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}
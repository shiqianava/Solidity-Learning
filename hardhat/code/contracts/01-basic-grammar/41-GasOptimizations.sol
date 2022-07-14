//SPDX-License-Identifier: MIT
// software package data exchange: 麻省理工学院 许可证
pragma solidity ^0.8.10;

/* 
Gas Saving Techniques 节省gas的技术
1. 使用 calldata 代替 memory (只能在external修饰的函数中使用)
2. 加载状态变量 state variable 到 memory
3. 用 ++i 代替for循环 i++
4. 缓存数组元素
5. Short ciruit 短路
*/

// gas golf
contract GasGolf {
    // start - 50908 gas
    // use calldata - 49163 gas
    // load state variables to memory - 48952 gas
    // short circuit - 48634 gas
    // loop increments - 48244 gas
    // cache array length - 48209 gas 
    // load array elements to memory - 48047 gas
    // uncheck i overflow/underflow - 47309 gas

    uint public total;

    // start - 没有优化gas的情况
    // 传入数组，统计其中是偶数并且小于99的数字的和
    // function sunIfEvenAndLessThan99(uint[] memory nums) external {
    //     for(uint i = 0; i < nums.length; i += 1) {
    //         bool isEven = nums[i] % 2 == 0;
    //         bool isLessThan99 = nums[i] < 99;
    //         if(isEven && isLessThan99) {
    //             total += nums[i];
    //         }
    //     }
    // }

    // gas optimized
    // [1, 2, 3, 4, 5, 100]
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        // 将storage的状态变量，赋值给memory的局部变量
        // 
        uint _total = total; 
        uint len = nums.length; // 需要的变量提前赋值？

        for(uint i = 0; i < len;) {
            uint num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }

            // "checked"（检查）模式。
            // 算术运算，进行溢出检查，如果结果溢出，会出现失败异常回退。
            unchecked { 
                ++i;
            }
        }
        total = _total;
    }
    
}
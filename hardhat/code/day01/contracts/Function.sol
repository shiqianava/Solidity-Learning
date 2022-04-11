// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Function {
    // Functions can return multiuple values.
    function returnMany()
        public
        pure
        returns (
            uint, 
            bool,
            uint
        )
    {
        return(1, true, 2);
    }

    // Return values can be named.
    function named() 
        public
        pure
        returns (
            uint x,
            bool y,
            uint z
        )
    {
        return (1, true, 2);
    }

    // Return value can be assigned to their name.
    // In this case the return statement can be omitted.
    function assigned() 
        public
        pure
        returns (
            uint x,
            bool y,
            uint z
        )
    {
        x = 1;
        y = true;
        z = 2;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple
    function destructoringAssignment()
        public
        pure
        returns (
            uint,
            bool,
            uint,
            uint,
            uint
        )
    {
        (uint a,bool b,uint c) = returnMany();

        // Value can be left out.
        (uint d, ,uint e) = (4, 5, 6);

        return (a, b, c, d, e);
    }

    // Cannot use map for either input or output 
    
    // Can use array for input
    function arrayInput(uint[] memory _arr) public {}

    // map 不能用来作为输入或者输出
    // 包含(嵌套)映射的类型只能是内部函数或库函数的参数或返回变量。  
    // 输入：作为函数参数输入，输出：作为函数返回值输出
    // function mapInput(mapping(uint => address) memory _map) public {}

    // Can use array for output
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}

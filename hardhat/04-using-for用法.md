简单的例子

```
using A for B
```

- 可用于在合约的上下文中，将库函数（来自库A）附加到任何类型（B）

详细的例子

```
pragma solidity ^0.8.13;
library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");
        return z;
    }
}

contract TestSafeMath {
    using SafeMath for uint;

    function testAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y);
    }
}
```


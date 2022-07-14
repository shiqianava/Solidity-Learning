## abi编码函数

https://blog.csdn.net/qq_35434814/article/details/104682616

#### 什么是abi

> 应用程序[二进制](https://so.csdn.net/so/search?q=二进制&spm=1001.2101.3001.7020)接口，以太坊的调用合约时的接口说明
> ABI是两个程序模块之间的接口，主要是用于将数据编码或[解码](https://so.csdn.net/so/search?q=解码&spm=1001.2101.3001.7020)为源代码所表示的代码。
> 以太坊中主要用于solidity合约的函数调用，以及反向编码读取数据的中的方法

#### solidityABI编码函数

- abi.encode(…) returns (bytes)：计算参数的 ABI 编码。
- abi.encodePacked(…) returns (bytes)：计算参数的紧密打包编码
- abi.encodeWithSelector(bytes4 selector, …) returns (bytes)： 计算函数选择器和参数的 ABI 编码
- abi.encodeWithSignature(string signature, …) returns (bytes): 等价于 abi.encodeWithSelector(bytes4(keccak256(signature), …)

#### solidityABI编码函数 实现细节

> 函数选择器，官方文档定义如下：
> 一个函数调用数据的前 4 字节，指定了要调用的函数。这就是某个函数签名的 Keccak（SHA-3）哈希的前 4 字节（高位在左的大端序）（译注：这里的“高位在左的大端序“，指最高位字节存储在最低位地址上的一种串行化编码方式，即高位字节在左）。 这种签名被定义为基础原型的规范表达，基础原型即是函数名称加上由括号括起来的参数类型列表，参数类型间由一个逗号分隔开，且没有空格。

> 简单来说，函数选择器就是通过函数名来参数来标识函数，可以用于不同合约之间的函数调用

合约中函数调用截取调用数据的前四个字节（0x之后），就是将函数名以及参数类型进行签名处理（Keccak–Sha3），

- 执行set(21)函数 可以得到结果: 60fe47b1 set(uint256) -这便是获取到函数签名散列截取到的前四个字节(一个字节对应16进制2个字符)
- 传入参数为21 对于16进制为15
- 函数最终结果： 0x60fe47b10000000000000000000000000000000000000000000000000000000000000015

> 合约函数名与函数参数，每个参数最终要被补全为32个字节
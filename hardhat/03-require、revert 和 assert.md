**Require vs assert**
同样作为判断一个条件是否满足的函数，require会退回剩下的gas，而assert会烧掉所有的gas。

**Revert**
revert的用法和throw很像，也会撤回所有的状态转变。但是它有两点不同：

1. 它允许你返回一个值；

2. 它会把所有剩下的gas退回给caller

调用起来就像这样子：

revert(‘Something bad happened’);

require(condition, ‘Something bad happened’);

例子：

以下三个语句的功能完全相同：

```solidity
if(msg.sender != owner) { revert(); }

assert(msg.sender == owner);

require(msg.sender == owner);
```

**字节码输出分析**

require()函数应用于满足输入或合约状态变量等有效条件，或验证调用外部合约的返回值等，总之require()语句的失败报错应该被看作一个正常的判断语句流程不通过的事件，而assert()语句的失败报错，意味着发生了代码层面的错误事件，很大可能是合约中有一个bug需要修复。

**使用require()的情况有：**

验证用户输入，例如require(input_var>100);

验证外部合约的调用结果，例如require(external.send(amount));

在执行状态更改操作之前验证状态条件，例如require(block.number > 49999)或require(balance[msg.sender]>=amount)
一般来说，使用require()的频率更多，通常应用于函数的开头

**使用assert()的情况有：**

检查溢出（上溢出或者下溢出）
检查不变量
更改后验证状态
预防永远不会发生的情况
一般来说，使用assert()的频率较少，通常用于函数的结尾

基本上，require()应该是您检查条件的功能，assert()只是为了防止发生任何非常糟糕的事情，但条件不应该等于为false.

另外，不能盲目的使用require()去检查溢出问题，只有在你认为之前的检查过程中（require()或if语句）不会产生溢出的情况下使用。
————————————————
版权声明：本文为CSDN博主「bareape」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/bareape/article/details/123523332
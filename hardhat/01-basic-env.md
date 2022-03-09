## 相关文档

区块链、智能合约、EVM相关概念以及前端工程化开发、Node.js等开发基础，请参考[登链汉化的Solidity官方文档-入门智能合约章节](https://learnblockchain.cn/docs/solidity/introduction-to-smart-contracts.html#blockchain-basics)。

## 开发环境准备

Win10x64，Node.js版本16.14.0，智能合约的测试、部署工具我选择了[Hardhat](https://hardhat.org/)。

> Hardhat是一个编译、部署、测试和调试以太坊应用的开发环境。它可以帮助开发人员管理和自动化构建智能合约和DApps过程中固有的重复性任务，并围绕这一工作流程轻松引入更多功能。这意味着hardhat在最核心的地方是编译、运行和测试智能合约。
>
> Hardhat内置了Hardhat网络，这是一个专为开发设计的本地以太坊网络。主要功能有Solidity调试，跟踪调用堆栈、`console.log()`和交易失败时的明确错误信息提示等。
>
> Hardhat Runner是与Hardhat交互的CLI命令，是一个可扩展的任务运行器。它是围绕**任务**和**插件**的概念设计的。每次你从CLI运行Hardhat时，你都在运行一个任务。例如，`npx hardhat compile`运行的是内置的`compile`任务。任务可以调用其他任务，允许定义复杂的工作流程。用户和插件可以覆盖现有的任务，从而定制和扩展工作流程。
>
> Hardhat的很多功能都来自于插件，而作为开发者，你可以自由选择想使用的插件。Hardhat不限制使用什么工具的，但它确实有一些内置的默认值。所有这些都可以覆盖

编辑器使用vscode，安装solidity扩展。

相关的开发文档，遇到问题可以查阅：[Hardhat中文文档](https://learnblockchain.cn/docs/hardhat/getting-started/)、[Solidity中文文档](https://learnblockchain.cn/docs/solidity/introduction-to-smart-contracts.html)

## 新建项目

创建项目文件夹，初始化并安装hardhat：

```shell
npm init
npm i hardhat --save-dev
```

安装完毕后，运行：

git bash中运行会报错，需要在Windows PowerShell中运行这些命令，项目全部创建完毕后，才能使用git bash。

```shell
npx hardhat

Error HH15: You are not inside a project and Hardhat failed to initialize a new one.

If you were trying to create a new project, please try again using Windows Subsystem for Linux (WSL) or PowerShell.
```

选择第一项 "Create a basic sample project"，一路回车即可。

![images/project-contruct](D:\GitHub-Repository\Solidity-Learning\hardhat\images\project-construct.png)

- contracts为合约文件夹，用于存档各种你写的sol文件
- script为脚本文件夹，里面可以存放各种自定义js脚本，比如合约部署脚本等等
- test为单元测试
- hardhat.config.js文件用来配置hardhat的基本信息和各种自动化任务

最后不要忘了运行一下命令安装依赖：

```
npm install --save-dev "hardhat@^2.8.3" "@nomiclabs/hardhat-waffle@^2.0.0" "ethereum-waffle@^3.0.0" "chai@^4.2.0" "@nomiclabs/hardhat-ethers@^2.0.0" "ethers@^5.0.0"
```

安装依赖后，此时如果再次运行 npx hardhat，则会显示出所有可用的指令：

![](D:\GitHub-Repository\Solidity-Learning\hardhat\images\hardhat-command.png)

## 第一个智能合约

首先进入contracts文件夹，删掉自动生成的Greeter.sol，新建HelloWorld.sol。

```solidity
// SPDX-License-Identifier: GPL-3.0
// 规定Solidity编译器版本，不同版本可能有不同的语法和特性
// solidity 版本不匹配，需要选择 0.8.4
pragma solidity ^0.8.9;

//引入hardhat自带的console模块，可以使用js中的console.log方法输入日志
import 'hardhat/console.sol';

//contract关键字用于创建合约，类似于标准OOP语言中的“类(Class)”
contract HelloWorld {
    //声明一个字符串类型的message属性，public标识它可以在合约外部被读取
    string public message;

    //构造函数，与标准OOP语言中的构造函数一样，在创建合约时（类似于类的实例化）执行一次
    //memory关键字表示临时存储，不持久化保存数据（对应storage关键字）
    constructor(string memory _message) {
        message = _message;
    }

    //这里定义了一个可以被公开访问say方法，view代表可以读取状态变量但不可修修改
    //在0.4.17版本以前的constant关键字等同于后来的view，后来constant关键字被废弃
    function say() public view returns (string memory) {
        console.log('Hello World!');
        return message;
    }
}
```

**注意：第一行的版权许可不要删掉！**

上面实现了一个非常简单的智能合约，只定义了一个变量、一个方法和一个构造函数。

智能合约非常像标准面向对象语言中的”类“，合约中可以包括变量、方法、事件、结构体等，其也有继承（Solidity支持多重继承）、重写等特性。创建合约类似于将一个类实例化，此时会调用构造函数，初始化各种持久化的变量。执行完成后代码会部署到链上，这时候我们就可以与合约交互了。

Solidity规定一个合约中最多定义一个构造函数，方法的书写方式是function关键字+方法名(参数)在前，后面再写修饰符，有返回值的方法最后要加上returns关键字+返回值类型（说实话有点别扭...）。

### 编译合约

当solidity ^0.8.9，运行以下指令报错：

```shell
npx hardhat compile

Error HH606: The project cannot be compiled, see reasons below.

The Solidity version pragma statement in these files doesn't match any of the configured compilers in your config. Change the pragma or configure additional compiler versions in your hardhat config.

  * contracts/HelloWorld.sol (^0.8.9)
```

修改为 solidity >=0.7.0 <0.9.0，可以找到合适的版本 0.8.9：

```solidity
pragma solidity ^0.8.4;
```

编译完成后会多出两个文件夹：artifacts和cache。artifacts存放编译好的工件文件、调试文件以及一些构建信息文件，cache里的solidity-files-cache.js则保存了一些编译合约文件时生成的基本信息。

我们这边要着重关注的是编译出来的工件文件：HelloWorld.json

> 一个**工件**拥有部署和与合约交互所需的所有信息。这些信息与大多数工具兼容，包括Truffle的artifact格式。每个工件都由一个以下属性的 json 组成。
>
> - `contractName`: 合约名称的字符串。
> - `abi`：**合约ABI的[JSON描述](https://learnblockchain.cn/docs/solidity/abi-spec.html)**。
> - `bytecode`：一个`0x`前缀的未连接部署字节码的十六进制字符串。如果合约不可部署，则有`0x`字符串。
> - `deployedBytecode`：一个`0x`前缀的十六进制字符串，表示未链接的运行时/部署的字节码。如果合约不可部署，则有`0x`字符串。
> - `linkReferences`：字节码的链接参考对象由solc返回。如果合约不需要链接，该值包含一个空对象。
> - `deployedLinkReferences`：已部署的字节码的链接参考对象由solc返回。如果合约不需要链接，该值包含一个空对象。

hardhat在每次编译时会检查文件，如果距离上次编译没有任何改动的话则默认不会编译。如果要强行重新编译，请加上--force参数：

```shell
npx hardhat compile --force
```

### 测试合约

进入test文件夹，删除里面的sample-test.js，新建test.js：

Hardhat默认的测试框架是Waffle，这东西普通的开发者可能之前没听说过（包括我），但是这个框架是基于大名鼎鼎的mocha和chai开发出来的。

```javascript
const { expect } = require('chai')
const { ethers } = require('hardhat')

describe('合约基本测试', function () {
  it('调用say方法，日志应该输出"Hello, world!"', async () => {
    //返回一个HelloWorld合约的工厂promise
    const HelloWorld = await ethers.getContractFactory('HelloWorld')
    //开始部署合约并且返回实例化出来的合约对象的promise
    const hw = await HelloWorld.deploy('Hello, world!')
    //等待合约部署完毕
    await hw.deployed()
    //hw可以调用合约的成员方法，上面这一系列操作非常类似标准OOP中的实例化操作
    expect(await hw.say()).to.equal('Hello, world!')
  })
})
```

运行命令：

```
npx hardhat test
```

![](D:\GitHub-Repository\Solidity-Learning\hardhat\images\hardhat-test.png)

### 部署合约

接下来我们准备部署合约。首先，进入 scripts文件夹，删除里面的文件，新建deploy.js

```javascript
const { ethers } = require('hardhat')

const main = async () => {
  //其实部署方法起来跟之前的测试完全一样
  const HelloWorld = await ethers.getContractFactory('HelloWorld')
  const hw = await HelloWorld.deploy('HelloWorld')
  await hw.deployed()
    
  console.log('合约部署成功，地址:', hw.address)
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
```

接下来我们启动一下Hardhat Network，这是一个为开发而设计的本地以太坊网络。

> ## Hardhat Network是如何工作的？
>
> - 它在收到每笔交易后，立即按顺序出块，没有任何延迟。
> - 底层是基于 `@ethereumjs/vm` EVM 实现, 与ganache、Remix和Ethereum Studio 使用的相同EVM。
> - 支持以下的硬分叉:
>   - byzantium
>   - constantinople
>   - petersburg
>   - istanbul
>   - muirGlacier

打开一个新终端，运行命令：

```
npx hardhat node
```

![](D:\GitHub-Repository\Solidity-Learning\hardhat\images\hardhat-network-start.png)

> 它将启动Hardhat Network，并作为一个公开的JSON-RPC和WebSocket服务器。
>
> 然后，只要将钱包或应用程序连接到`http://localhost:8545` 。
>
> 如果你想把Hardhat连接到这个节点，你只需要使用`--network localhost`来运行命令。
>
> Hardhat Network默认用此状态初始化：
>
> - 一个全新的区块链，只是有创世区块。
>
> - 220个账户，每个账户有10000个ETH，助记词为:
>
>   ```
>   "test test test test test test test test test test test junk"
>   ```

在原来的终端运行命令：

```
npx hardhat run --network localhost scripts/deploy.js
```

![](D:\GitHub-Repository\Solidity-Learning\hardhat\images\hardhat-contract-deploy.png)

#### Fork 主网(运行不了，需要其他配置)

> 你可以启动一个Fork主网的Hardhat Network实例。 Fork主网意思是模拟具有与主网相同的状态的网络，但它将作为本地开发网络工作。 这样你就可以与部署的协议进行交互，并在本地测试复杂的交互。
>
> 要使用此功能，你需要连接到存档节点。 建议使用[Alchemy](https://alchemyapi.io/?r=7d60e34c-b30a-4ffa-89d4-3c4efea4e14b)

本地测试网络上除了你自己部署的合约，没有其他任何东西。如果想拿主网上的一些现成的东西测试你还需要自己部署，繁琐不说还非常容易出错。本地分叉主网可以使你的本地测试网络模拟主网状态，让你拥有主网上的合约、账户、ERC20 代币等。

要使用Fork主网可以通过以下两种方法。

第一种是直接加--fork参数，字符 “<” 和 “>” 表示占位符，需要加引号：

```
npx hardhat node --fork “https://eth-mainnet.alchemyapi.io/v2/<key>”
```

另一种是在hardhat.config.js进行配置，然后再启动节点，不需要加--fork参数：

```
networks: {
  hardhat: {
    forking: {
      url: "https://eth-mainnet.alchemyapi.io/v2/<key>"
    }
  }
}
```

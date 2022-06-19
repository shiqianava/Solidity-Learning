// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Try Catch
try / catch 只能从 外部函数调用 和 合约创建 中捕获错误
*/

// 外部合约使用try / catch的例子
contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my func was called";
    }
}

contract Bar {
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;
    constructor() {
        // 这个Foo合约被用来作为外部调用try / catch的例子
        foo = new Foo(msg.sender);
    }

    // 外部调用try / catch的例子
    // tryCatchExternalCall(0) => Log("external call failed")
    // tryCatchExternalCall(1) => Log("my func was called")
    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns (string memory result) {
            emit Log(result);
        } catch {
            emit Log("external call failed");
        }
    }

    // 合约创建try / catch例子
    // tryCatchNewContrat(0x0000000000000000000000000000000000000000) => Log("invilid address")
    // tryCatchNewContrat(0x0000000000000000000000000000000000000001) => LogBytes("")
    // tryCatchNewContract(0x0000000000000000000000000000000000000002) = > Log("Foo create")
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            // 你可以在这里使用变量 foo
            emit Log("Foo create");
        } catch Error(string memory reason) {
            // revert() 和 require() 捕捉异常
            emit Log(reason);
        } catch (bytes memory reason){
            // assert() 捕捉异常
            emit LogBytes(reason);
        }
    }
}
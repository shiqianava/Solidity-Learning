// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
/* 
Hashing with Keccak256
keccak256算法计算"输入"的 Keccak-256 哈希值
一些用例如下：
1. 从输入创建确定性惟一ID
2. Commit-Reveal scheme（提交-释放 方案）
3. 压缩密码签名（通过压缩后的哈希值来签名，替代大的输入）
*/
contract HashFunction {
    function hash(
        string memory _test,
        uint _num,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_test, _num, _addr));
    }

    // hash冲突的例子
    // 当传递多个动态数据类型到abi.encodePacked()，可能会发生hash冲突
    // 在这个例子中，应该使用abi.encode()来代替
    function collision(string memory _text, string memory _anotherText)
        public
        pure
        returns (bytes32) 
    {
        // encodePacked(AAA, BBB) -> AAABBB
        // necodepacked(AA, ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_text, _anotherText);)
    }
}

contract GuessTheMagicWord {
    bytes32 public answer = 0x60298f78cc9c10aa380b47170ba751d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
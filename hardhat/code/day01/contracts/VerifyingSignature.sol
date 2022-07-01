// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* 
Verifying Signature
消息可以在链外签名，然后使用智能合约进行链上验证
怎样签名和验证？
# 签名
1. 创造要签名的消息
2. 获得消息的哈希值
3. 签名哈希值（在链外，对您的私有秘钥保密）
# 验证
1. 从原始消息重新创建哈希
2. 从签名和哈希值中恢复签名者
3. 比较恢复的签名者和声明的签名者
*/

contract VerifySignature {
    /* 1. 解锁MetaMask account
    ethereum.enable()
    */

    /* 2. 获取要签名的消息哈希
    getMessageHash(
        0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C,
        123,
        "coffee and donuts",
        1
    )

    hash = "0xcf36ac4f97dc10d91fc2cbb20d718e94a8cbfe0f82eaedc6a4aa38946fb797cd"
    */

    function getMessageHash(
        address _to,
        uint _amount,
        string memory _message,
        uint _nonce
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }

    /* 3.签名消息后得到的哈希值
    # 使用浏览器
    account = "在此处复制粘贴签名者的账户"
    ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)

    # 使用 web3
    web3.personal.sign(hash, web3.eth.defaultAccount, console.log)

    不同账户的签名不同
    0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */
    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32) 
    {
        /* 签名是通过使用以下格式，对keccak256散列值签名生成的：
        "\x19Ethereum Signed Message\n" + len(msg) + msg
        len(msg)的值是 32byte
        */
        return
        keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash)
        );
    }

    /* 4. Verify signature
    signer = 0xB273216C05A8c0D4F0a4Dd0d7Bae1D2EfFE636dd
    to = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C
    amount = 123
    message = "coffee and donuts"
    nonce = 1
    signature =
        0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */
}
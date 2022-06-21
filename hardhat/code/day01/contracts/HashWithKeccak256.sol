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
contract
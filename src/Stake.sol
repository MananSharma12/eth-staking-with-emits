// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Stake {
    mapping(address => uint256) public balances;

    constructor() {
    }

    function stake() public payable {
        require(msg.value > 0, "You have to pay!");
        balances[msg.sender] += msg.value;
    }

    function unstake(uint256 _amount) public {
        require(_amount <= balances[msg.sender], "You don't have enough balance to unstake");
        balances[msg.sender] -= _amount;
    }

    function getRewards() public {}

    function claimRewards() public {}
}

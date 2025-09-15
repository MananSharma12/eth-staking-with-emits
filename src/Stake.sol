// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Stake {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public lastUpdateTime;
    mapping(address => uint256) public unclaimedRewards;

    constructor() {
    }

    function stake() public payable {
        require(msg.value > 0, "You have to pay!");
        if (!lastUpdateTime) {
            lastUpdateTime[msg.sender] = block.timestamp;
        } else {
            unclaimedRewards[msg.sender] = (block.timestamp - lastUpdateTime[msg.sender]) * balances[msg.sender];
            lastUpdateTime[msg.sender] = block.timestamp;
        }

        balances[msg.sender] += msg.value;
    }

    function unstake(uint256 _amount) public {
        require(_amount <= balances[msg.sender], "You don't have enough balance to unstake");

        unclaimedRewards[msg.sender] = (block.timestamp - lastUpdateTime[msg.sender]) * balances[msg.sender];
        lastUpdateTime[msg.sender] = block.timestamp;

        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
    }

    function getRewards(address _address) public {
        return unclaimedRewards[_address] + ((block.timestamp - lastUpdateTime[_address]) * balances[_address]);
    }

    function claimRewards() public {
        unclaimedRewards[msg.sender] += (block.timestamp - lastUpdateTime[msg.sender]) * balances[msg.sender];

        // Transfer all unclaimed rewards to the user

        unclaimedRewards[msg.sender] = 0;
        lastUpdateTime[msg.sender] = block.timestamp;
    }
}

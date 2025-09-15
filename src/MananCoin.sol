// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MananCoin is ERC20, Ownable {
    address private stakingContract;

    constructor(address _stakingContract) ERC20("Manan", "MAN") Ownable(msg.sender) {
        stakingContract = _stakingContract;
    }

    function mint(address account, uint256 value) public {
        require(msg.sender == stakingContract);
        _mint(account, value);
    }

    function updateStakingContract(address _stakingContract) public onlyOwner {
        stakingContract = _stakingContract;
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Stake} from "../src/Stake.sol";

contract StakeTest is Test {
    Stake public stakeContract;

    function setUp() public {
        stakeContract = new Stake();
    }

    function test_Stake() public {
        stakeContract.stake{value: 200}();
        assertEq(stakeContract.balances(address(this)), 200);
    }

    function test_Unstake() public {
        stakeContract.stake{value: 200}();
        stakeContract.unstake(100);
        assertEq(stakeContract.balances(address(this)), 100);
    }

    function testRevert_Unstake() public {
        stakeContract.stake{value: 200}();
        vm.expectRevert();
        stakeContract.unstake(300);
    }
}

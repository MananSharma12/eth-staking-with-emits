// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {MananCoin} from "../src/MananCoin.sol";

contract MananCoinTest is Test {
    MananCoin public mananCoin;

    function setUp() public {
        mananCoin = new MananCoin(address(this));
    }

    function test_InitialSupply() public view {
        assertEq(mananCoin.totalSupply(), 0);
    }

    function testRevert_Subtract43() public {
        // Random Address to test
        vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        vm.expectRevert();
        mananCoin.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 100);
    }

    function test_Mint() public {
        mananCoin.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 10);
        assertEq(mananCoin.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 10);
    }

    function test_UpdateStakingContract() public {
        mananCoin.updateStakingContract(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        mananCoin.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 10);
        assertEq(mananCoin.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 10);
    }
}

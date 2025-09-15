// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Stake} from "../src/Stake.sol";

contract StakeScript is Script {
    Stake public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new Stake();

        vm.stopBroadcast();
    }
}

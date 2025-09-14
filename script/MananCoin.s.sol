// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {MananCoin} from "../src/MananCoiān.sol";

contract MananCoin is Script {
    MananCoin public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new MananCoin();

        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import {Test} from "forge-std/Test.sol";
import {console2 as console} from "forge-std/console2.sol";

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

interface SimpleStore {
    function setValue(uint256) external;
    function getValue() external returns (uint256);
}

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    SimpleStore simpleStore;

    /// @dev Setup the testing environment.
    function setUp() public {
        simpleStore = SimpleStore(HuffDeployer.deploy("SimpleStore"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue(uint256 value) public {
        simpleStore.setValue(value);
        
        assertEq(value, simpleStore.getValue());
    }
}
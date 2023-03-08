//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    //************************
    //******Exercise 4********
    //************************
    uint storedData;

    // no need memory/calldata 
    // bcz uint is not a array/structured/mapping type.
    function set(uint data) public {
        storedData = data;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    function increment(uint n) public {
        // Use function modifier,
        // dont use if... logic here, 
        // bcz required to execute the function
        storedData += n;
    }

    function decrement(uint n) public {
        storedData -= n;
    }
}
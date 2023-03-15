//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //************************
    //******Exercise 2********
    //************************
    // string value;

    // constructor() {
    //     value = "BMIS2003";
    // }

    // function get() public view returns (string memory) {
    //     return value;
    // }

    // function set(string calldata _newvalue) public {
    //     value = _newvalue;
    // }

    //************************
    //******Exercise 3********
    //************************
    // Modifier:
    // 1. visibilityModifier (public, private)
    // 2. accessModifier (constant)
    // 3. functionModifier ("rules/policies")
    string public constant value = "BMIS2003";

    // no need constructore bcz 'value = "BMIS2003"'
    // constructor() {
    //     value = "BMIS2003";
    // }

    // no need get bcz 'public'
    // function get() public view returns (string memory) {
    //     return value;
    // }

    // no need set bcz 'constant'
    // function set(string calldata _newvalue) public {
    //     value = _newvalue;
    // }
}

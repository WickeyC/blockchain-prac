//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeter {
    string yourName;

    //constructor not public, bcz only contract itself calling
    //constructor() public {
    constructor() {
        yourName = "world123";
    }

    function set(string memory name) public {
        yourName = name;
    }

    //for ^0.4.0, 
    //constant because not changing the state variable
    //function hello() constant public returns (string) { 

    //^0.8.0, 
    //need to specify memory or calldata
    //because they want to clearly constraint bcz cost is involved based on code
    
    //need to define the view accessibility
    // (not changing state variable, no transaction fees)
    function hello() public view returns (string memory) { 
        return yourName;
    }
}
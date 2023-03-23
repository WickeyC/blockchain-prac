//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// interface ParentInterfaceForChildA {
//     function SchoolOpen()  pure external returns (string memory);
//     function setValue()  external returns (uint);
// }

abstract contract ParentInterfaceForChildA {
    function SchoolOpen() virtual pure external returns (string memory);
    function setValue() virtual external returns (uint);
}

// abstract contract ParentInterfaceForChildB {
//     function setValue() virtual external;
// }

contract Parent {
    uint internal sum;

    function setValue() external returns (uint) {
        uint a = 20;
        uint b = 50;

        sum = a + b;

        return sum;
    }

    function SchoolOpen() pure external returns (string memory) {
        return "third day of the school.";
    }
}
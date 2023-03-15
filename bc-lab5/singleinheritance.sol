//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract parent {
    uint internal sum;

    function setValue() external {
        uint a = 20;
        uint b = 50;

        sum = a + b;
    }
}

contract child is parent {
    function getValue() external view returns (uint) {
        return sum;
    }
}

//defining calling contract
contract caller {
    uint public data1 = 1; //256 bits == 32 bytes
    int public data2 = -99;
    bool public data3 = true;
    uint8 public data4 = 9; //8 bits

    child child_instance = new child();
    address payable OwnerAddress;

    constructor (){
        //must explicitly convert to payable
        OwnerAddress = payable(msg.sender);
    }

    function getAddress() public view returns (address, address) {
        address localAddress = msg.sender;
        return (OwnerAddress, localAddress);
    }

    function testCallInherit() public returns (uint) {
        child_instance.setValue();
        return child_instance.getValue();
    }
}

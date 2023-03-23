//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Method 1
import './parent.sol';

contract ChildA {
    address parentAddress;

    function setParentAddress(address _inputAddress) external {
        parentAddress = _inputAddress;
    }

    function getValue() external returns (uint) {
        ParentInterfaceForChildA parentInterface = ParentInterfaceForChildA(parentAddress);
        return parentInterface.setValue();
    }

    function callSchoolMsg() public view returns(string memory) {
        ParentInterfaceForChildA parentInterface = ParentInterfaceForChildA(parentAddress);
        return parentInterface.SchoolOpen();
    }
}
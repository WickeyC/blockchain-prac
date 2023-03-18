//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bidder {
    string private name;
    uint private bidAmount;
    bool private eligible;
    uint private constant minBid = 2000;

    function setName(string memory _name) public {
        name = _name;
    }

    function setBidAmount(uint _bidAmount) public {
        bidAmount = _bidAmount;
    }

    function determineEligibility() public{
        (bidAmount >= minBid) ? eligible = true : eligible = false;
    }
}


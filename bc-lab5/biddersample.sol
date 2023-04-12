// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bidder{
    string public name;
    uint public bidAmount;
    bool public eligible;
    uint public minBid;

    address public winnerAddress;
    uint public winnerTimeStamp;
    //uint public winnerAmount = 0;

    //shuold be called by owner/seller
    function setName(string memory _name, uint _mBid, uint _bAmount) public {
        name = _name;
        minBid = _mBid;
        bidAmount = _bAmount;
    }
    
    //should be called by buyer
    function setBidAmount (uint _buyerBidAmount) public {
            determineEligibility (_buyerBidAmount);
           
    }

    function determineEligibility (uint _buyerBidAmount) internal{
        if (_buyerBidAmount >= minBid)
        {
            eligible = true;
            bidAmount = bidAmount + _buyerBidAmount; 
	        winnerAddress = msg.sender;
            winnerTimeStamp = block.timestamp;         
        }
        else
        eligible = false;
    }


}
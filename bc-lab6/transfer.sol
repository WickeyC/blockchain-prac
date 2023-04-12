//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract transfer {
    address payable public buyer;
    address payable public seller;
    string public product;

    //receiver address passed down from web (not from wallet itself) 
    function setProduct(string memory _nameP) public {
        product = _nameP;
        seller = payable (msg.sender);
    }

    function buyProduct() public payable{
        buyer = payable(msg.sender);
        //seller = _toReceiver;
        seller.transfer(msg.value);
    }

    // function buyProduct(address payable _toReceiver) public payable{
    //     buyer = payable(msg.sender);
    //     seller = _toReceiver;
    //     seller.transfer(msg.value);
    // }
}

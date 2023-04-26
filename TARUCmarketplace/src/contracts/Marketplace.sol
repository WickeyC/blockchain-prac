pragma solidity ^0.5.0;

contract Marketplace{
    string public name;

    mapping (uint => Product) public products;
    uint public productCount = 0;

    struct Product{
        uint id;
        string name;
        uint price;
        address payable owner; 
        bool purchased;
    }

    event ProductCreated(
        uint id,
        string name,
        uint price,
        address payable owner, 
        bool purchased
    );

    event ProductPurchased(
        uint id,
        string name,
        uint price,
        address payable owner, 
        bool purchased
    );

    constructor() public{
        name = "TAR UC Marketplace";
    }

    function createProduct(string memory _name, uint _price) public{
        //make sure parameters are correct
        //require a valid name
        require(bytes(_name).length > 0);

        //require a valid price
        require(_price > 0);
        //increment product count 
        productCount++;
        //create the product
        products[productCount] = Product(productCount, _name, _price, msg.sender, false);
        //trigger an event
        emit ProductCreated(productCount, _name, _price, msg.sender, false);
    }

    function purchaseProduct(uint _id) public payable{
        //Fetch the product, local variable _product
         Product memory _product = products[_id];  
        
        //fetch the owner
         address payable _seller = _product.owner;
        
        //make sure the product has a valid id
        require(_product.id > 0 && _product.id <= productCount);
        
        //Require that there is enough Ether in the transaction
        require(msg.value >=_product.price);

        //require that the product has not been purchased already
        require(! _product.purchased);
        
        //require that the buyer is not the seller
        require(_seller != msg.sender);

        // purchase it/transfer ownership to the buyer
        _product.owner = msg.sender;

        //mark as purchased
        _product.purchased = true;

        //update the product in the product mapping
        products[_id] = _product;

        //Pay the seller by sending them Ether
        address(_seller).transfer(msg.value);
        
        //Trigger an event
         emit ProductPurchased(productCount, _product.name, _product.price, msg.sender, true);



    }
}
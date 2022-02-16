pragma solidity ^0.4.18;

contract Marketplace{
    string public name;
    uint public productCount = 0;

    struct product {
        uint id;
        string name;
        uint price;
        address owner;
        bool purchased; 
    }

    event ProductAdded{
        uint id;
        string name;
        uint price;
        address owner;
        bool purchased; 
    }

    mapping(uint => product) public products;

    function Marketplace() public {
        name = "Blockchain Marketplace";
    }

    function addProduct(string memory _name, uint memory _price) public {
        require(bytes(name).length > 0);
        require(_price > 0);
        productCount++;
        products[productCount]=product(productCount,_name,_price,msg.sender,false);
        emit ProductAdded(productCount,_name,_price,msg.sender,false);

    }
}
pragma solidity ^0.5.0;

contract Marketplace{
    string public name;
    uint public productCount = 0;

    struct Product {
        uint id;
        string name;
        uint price;
        address payable owner;
        bool purchased; 
    }

    event ProductAdded(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased, 
    );

    event ProductBought(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased,
    );

    mapping(uint => Product) public products;

    function Marketplace() public {
        name = "Blockchain Marketplace";
    }

    function addProduct(string memory _name, uint memory _price) public {
        require(bytes(name).length > 0);
        require(_price > 0);
        productCount++;
        products[productCount]=Product(productCount,_name,_price,msg.sender,false);
        emit ProductAdded(productCount,_name,_price,msg.sender,false);

    }

    function buyProduct(uint memory _id) public payable{

        Product memory _product = products[id];
        address payable _seller = _product.owner;

        //condtitions
        require(_product.id > 0 && _product.id<productCount);
        require(msg.value >= _product.price);
        require(!_product.purchased);

        _product.owner = msg.sender;
        _product.purchased = true;
        products[id]=_product;
        address(_seller).transfer(msg.value);
        emit ProductBought(productCount,_product.name,_product.price,msg.sender,false);
    }
}
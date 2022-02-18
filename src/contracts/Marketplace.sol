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
        bool purchased 
    );

    event ProductBought(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );

    mapping(uint => Product) public products;

    constructor() public {
        name = "Blockchain Marketplace";
    }

    function addProduct(string memory _name, uint _price) public {
        require(bytes(name).length > 0);
        require(_price > 0);
        productCount++;
        products[productCount]=Product(productCount,_name,_price,msg.sender,false);
        emit ProductAdded(productCount,_name,_price,msg.sender,false);

    }

    function buyProduct(uint _id) public payable{

        Product memory _product = products[_id];
        address payable _seller = _product.owner;

        //condtitions
        require(_product.id > 0 && _product.id<productCount);
        require(msg.value >= _product.price);
        require(!_product.purchased);

        _product.owner = msg.sender;
        _product.purchased = true;
        products[_id]=_product;
        address(_seller).transfer(msg.value);
        emit ProductBought(productCount,_product.name,_product.price,msg.sender,false);
    }
}

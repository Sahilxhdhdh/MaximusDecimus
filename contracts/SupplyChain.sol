// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {

    struct Product {

        uint id;
        string name;
        string status;
        address participant;
        uint timestamp;
    }

    Product[] public products;

    function addProduct(
        uint _id,
        string memory _name,
        string memory _status
    ) public {

        products.push(
            Product(
                _id,
                _name,
                _status,
                msg.sender,
                block.timestamp
            )
        );
    }

    function updateStatus(
        uint index,
        string memory _newStatus
    ) public {

        products[index].status = _newStatus;

        products[index].participant = msg.sender;

        products[index].timestamp = block.timestamp;
    }

    function getProduct(uint index)
    public
    view
    returns(
        uint,
        string memory,
        string memory,
        address,
        uint
    ) {

        Product memory p = products[index];

        return (
            p.id,
            p.name,
            p.status,
            p.participant,
            p.timestamp
        );
    }
}
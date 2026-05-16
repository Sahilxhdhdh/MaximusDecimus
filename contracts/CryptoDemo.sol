// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoDemo {

    string public coinName = "DemoCoin";
    uint public totalSupply = 1000000;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getCoinDetails() public view returns(string memory, uint) {
        return (coinName, totalSupply);
    }
}
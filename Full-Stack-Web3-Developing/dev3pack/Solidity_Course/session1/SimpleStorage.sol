// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {
    uint public favoriteNumber;
    uint[] public favoriteNumberInArray; // array

    function storeUsingArray(uint _favoriteNumberInArray) public {
        favoriteNumberInArray.push(_favoriteNumberInArray);
    }

    struct Person {
        uint favoriteNumber;
        string name;
    }

    Person[] public list0fPeople;

    function store(uint _favoriteNumber, string memory _name) public {
        list0fPeople.push(
            Person({favoriteNumber: _favoriteNumber, name: _name})
        );
    }
}

// SPDX-License-Identifier: MIT


 pragma solidity >=0.8.0 <0.9.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

SimpleStorage[] public listOfSimpleStorageContract;

function createSimpleStorageContract()  public {
    SimpleStorage simpleStorageContractVariable = new SimpleStorage();
    listOfSimpleStorageContract.push(simpleStorageContractVariable);

}

function fsStore(uint256 _simpleStorageIndex , uint256 _simpleStorageNumber) public {
    listOfSimpleStorageContract[_simpleStorageIndex].store(_simpleStorageNumber);
}

 function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
       
        return listOfSimpleStorageContract[_simpleStorageIndex].retrieve();
    }
}
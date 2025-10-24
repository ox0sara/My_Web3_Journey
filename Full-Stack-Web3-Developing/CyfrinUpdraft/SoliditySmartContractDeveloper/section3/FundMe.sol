// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


import {PriceConverter} from "./PriceConverter.sol";
error NotOwner();   

contract FundMe {
    using PriceConverter for uint256; 

    uint256 public constant MIN_VALUE = 5e18;
    
    address[] public funders; //

    mapping (address funder => uint256 amountFounded) public addressToAmountFunded;

    address public immutable i_owner;
    constructor () {
        i_owner = msg.sender;

    }


    /**
     * @notice Allows users to fund the contract
     * @dev Requires the sent ETH amount to be worth at least `minValue` USD
     */
    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MIN_VALUE,
            "Need to send more ETH to meet the USD minimum"
        );
        // Optionally: store sender info or balance tracking here

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

   function withdraw() onlyOwner public {

    
    for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
        address funder = funders[funderIndex] ;
        addressToAmountFunded[funder] = 0;
    }
    funders = new address[](0);
    // payable(msg.sender).transfer(address(this).balance);


 /*    bool sendSucess = payable(msg.sender).send(address(this).balance);
    require(sendSucess, " send failed "); */

    (bool callSucces, ) = payable (msg.sender).call{value: address(this).balance}("");
    require(callSucces, " call failed");
   }

   modifier onlyOwner(){
        //require(msg.sender == i_owner, " must be owner");
        if (msg.sender != i_owner) {revert NotOwner();}
        _;
   }
   receive() external payable { 
    fund();
   }

   fallback() external payable {  fund();}
   
}

 // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
 
 import {AggregatorV3Interface} from "@chainlink/contracts@1.5.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal  view returns (uint256) {

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price, , ,) = priceFeed .latestRoundData();
        return uint256(price) * 1e10;



    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice(); // ETH price in USD with 8 decimals
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18; // Convert to USD with 18 decimals
        return ethAmountInUsd;
    }

    
    function getVersion() internal view returns (uint256) {
        return  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}
 
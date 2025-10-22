// SPDX-License-Identifier: MIT
 pragma solidity >=0.6.0 <0.9.0;

 contract FundMe {
    function fund () payable public{
       require( msg.value > 1e18, " didn't send eth ");
    }
 }


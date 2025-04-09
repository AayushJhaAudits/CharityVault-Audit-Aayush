// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CharityVault {
    mapping(address => uint256) public donations;

    // Users can donate ETH to the contract
    function donate() external payable {
        require(msg.value > 0, "Must send ETH");
        donations[msg.sender] += msg.value;
    }

    // Users can withdraw their donations
    function withdrawDonations() external {
        uint256 amount = donations[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        // 🔴 Vulnerability: state is updated after external call
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Transfer failed");

        donations[msg.sender] = 0;
    }

    // For receiving fallback donations
    receive() external payable {}
}

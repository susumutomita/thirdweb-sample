// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC1155LazyMint.sol";

contract sample is ERC1155LazyMint {
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC1155LazyMint(_name, _symbol, msg.sender, 0) {}

    function verifyClaim(
        address _claimer,
        uint256 _tokenId,
        uint256 _quantity
    ) public view override {
        require (_tokenId == 0, "Only sushi are claimed!");
        require (_quantity == 1, "Only one sushi can be claimed!");
    }

    function evolve() public{
            _burn(msg.sender, 0, 1);
            _mint(msg.sender, 1, 1,"");
    }
}

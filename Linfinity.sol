pragma solidity ^0.4.23;

import './ERC20Token.sol';

contract Linfinity is ERC20Token {
    
    constructor() public {
        name = "Linfinity";
        symbol = "LFT";
        decimals = 18;
        totalSupply = 3* 1000 * 1000 *1000;
    }
}
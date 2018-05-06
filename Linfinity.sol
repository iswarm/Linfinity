pragma solidity ^0.4.23;

import './ERC20Token.sol';

contract Linfinity is ERC20Token {
    
    uint256 public mintTotal;
    address public owner;
    
    event Mint(address _toAddress, uint256 _amount);
    
    constructor(address _owner) public {
        require(address(0) != _owner);
        
        name = "Linfinity";
        symbol = "LFT";
        decimals = 18;
        totalSupply = 3* 1000 * 1000 *1000;
        
        mintTotal = 0;
        owner = _owner;
    }
    
    function mint (address _toAddress, uint256 _amount) public returns (bool) {
        require(msg.sender == owner);
        require(address(0) != _toAddress);
        require(_amount >= 0);
        require( safeAdd(_amount,mintTotal) <= totalSupply);
        
        mintTotal = safeAdd(_amount, mintTotal);
        balances[_toAddress] = _amount;
        
        emit Mint(_toAddress, _amount);
        return (true);
    }
}
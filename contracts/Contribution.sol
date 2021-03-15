pragma solidity >=0.6.0 <0.8.0;

import './Token.sol';
import "@openzeppelin/contracts/math/SafeMath.sol";

/// @title Contribution contract
/// @author Juliano Miyabe
/// @notice This contract is used for donate ETH 
contract Contribution {
    using SafeMath for uint256;
    event donateEtherEvent(address userAddress, uint amountEther, uint tokens);
    Token private token;
    mapping(address => uint256) public userEther;

    constructor(Token _token) {
        token = _token;
    }

    ///@dev this function will donate ethereum and will mint token to the donator.
    function donateEther() payable public {
        require(msg.value > 0 ,"Please donate a valid amount of ETH");
        userEther[msg.sender] = userEther[msg.sender].add(msg.value);
        require(token.mint(msg.sender, msg.value), "Something went wrong");
        emit donateEtherEvent(msg.sender, msg.value, msg.value);
    }
    
    ///@dev this function will return the amount of tokens accondingly to the address
    ///@param userAddress is the donator address
    function getUserAmount(address userAddress) public view returns(uint256){
        return userEther[userAddress];
    }
}
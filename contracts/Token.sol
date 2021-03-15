pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title Token contract
/// @author Juliano Miyabe
/// @notice This token is created after a donation
contract Token is ERC20 {
    uint public startTime;
    uint public endTime;
    
    address public minter;

    event TokenMinter(address minter, uint startTime, uint endTime);
    
    ///@dev this paramers define the period that the token is mintable
    constructor(uint _startTime, uint _endTime) ERC20("Contribution Token", "CT") {
        startTime = _startTime;
        endTime = _endTime;
    }
    
    ///@dev this function will create tokens accordingly to the ETH donated
    ///@param userAddress is the donator address and ethAmout is the amount donated
    ///return this function will return true if the block time is beetwen the period defined in the constructor 
    function mint(address userAddress, uint256 ethAmount) public returns (bool){
        uint blockTimeStamp = block.timestamp;
        if(startTime <=  blockTimeStamp && endTime >= blockTimeStamp){
            _mint(userAddress, ethAmount);
            emit TokenMinter(userAddress, startTime, endTime);
            return true;
        } else {
            return false;
        }
    }
    ///@dev this function is used to change the timestamps which was used for test purposes
    function changeTimeStamps(uint _startTime, uint _endTime) public {
        startTime = _startTime;
        endTime =_endTime;
    }

}
# Contribution-Token
This project able users to donate ETH and get tokens accondingly to the amount donated.

# Prerequisites
- Ganache installed 
- Node js and npm

# How to deploy it
- npm install : To install the dependencies
- truffle compile : To compile the smartcontracts
- truffle migrate : To deploy the smartcontracts in the blockchain

# How to run the unit tests
- In the project directory run the `truffle test` command

# How to test it
- Access the truffle console by running `truffle console` command.
- Get the contribution contract with `contribution = Contribution.deployed()`.
- Now you can use the contract to donate ether running `contribution.donateEther({value: _somevalue, from: _someaddress})`.
- Also you can get the amount donated passing the donator address in the `getUserAmount(_someaddress)`
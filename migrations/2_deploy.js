const Token = artifacts.require("Token");
const Contribution = artifacts.require("Contribution");

module.exports = async function(deployer){
    await deployer.deploy(Token, 1610655985, 1639488403);

    const token =  await Token.deployed();

    await deployer.deploy(Contribution, token.address);
}
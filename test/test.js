// Token test

const Token = artifacts.require('./Token')
const Contribution = artifacts.require('./Contribution')

const etherDonate = 50;
const etherZero = 0;
const testAddress = '0x282f7695e5c398d77A91c1CD847173b7298127ce';
const startTime = 1;
const endTime = 10;

require('chai')
    .use(require('chai-as-promised'))
    .should()

contract('Token Tests', () => {
    let token, contribution;

    beforeEach(async () => {
        token = await Token.deployed();
        contribution = await Contribution.new(token.address);
    })

    describe('testing start and endtime', ()=> {
        describe('success cases', () => {
            it('token symbol', async () => {
                expect(await token.symbol()).to.be.eq('CT');
            })
            
            it('token mint', async () => {
                let result = await token.mint(testAddress, etherDonate);
                expect(result.logs.event, 'TokenMinter');
            })

            it('contribution', async () => {
                let result = await contribution.donateEther({value: etherDonate } )
                expect(result.logs.event, 'donateEtherEvent')
            })
        });

        describe('negative cases', () => {
            it('invalid time period', async () => {
                token.changeTimeStamps(startTime, endTime);
                let result = await contribution.donateEther({ value: etherDonate }).should.be.rejectedWith('VM Exception while processing transaction: revert');
            })

            it('invalid ETH amount', async () => {
                let result = await contribution.donateEther({ value: etherZero }).should.be.rejectedWith('VM Exception while processing transaction: revert');
            })
        })
    })
})
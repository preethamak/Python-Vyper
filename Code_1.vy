#get funds
#withdraw funds
#set minimum value of funding in usd

#pragma version 0.4.0
#@license: MIT

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view

minimum_usd: uint256
price_feed: AggregatorV3Interface #0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419

@deploy
def __init__():
    self.minimum_usd = 5 * (10**18) #or as_wei_value(5, "ether")
    self.price_feed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419)

    """This just gets the price value from Etherum network, 
    as this contract address is only valid for that chain.
    If we want to change it, Pass the parameter: price_feed_address
    to the deploy function, and pass that as an agrument to the
    AggregatorV3Interface funtion.
    """

@external
@payable
def fund():
    """Allows users to send money to this contract, Has minimum
    money to send"""
    usd_value_of_eth: uint256 = self._get_eth_to_usd(msg.value)
    assert usd_value_of_eth >seld.minimum_usd, "You must send more USD"

@external
def withdraw():
    pass

@external
@view
def _get_eth_to_usd(eth_amount: uint256) -> uint256:
    """We are using price variable, to get the price of 1 ether from the contract, 
    which has precision upto 8 decimal places, but we need to 18 decimal places, 
    as 1 ether to wei contains 18 zeros, So multiply with 10^10, also we are 
    using convert because price is a int256, and 10 is uint256, so multiplication
    of these variables is not possible, so vyper provides inbuilt function, convert()
    which takes 2 parameters, variable, and the datatype we want to convert that.
    Then we multiply eth_amount*eth_price to get the value in usd, and divide by 10^18
    to normalize all the zeros we added.
    """
    #0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419 Contract address of proce feed
    price: int256 = staticcall self.price_feed.latestAnswer() #8 Decimals.

    eth_price: uint256 = convert(price, uint256) * (10 ** 10)

    eth_amount_in_usd: uint256 = (eth_amount * eth_price) // (1*(10 ** 18))
    return eth_amount_in_usd

    
# @external
# @view
# def get_price() -> int256:
    # price_feed: AggregatorV3Interface = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419)
    # return staticcall price_feed.latestAnswer()        #Static call is the keyword to show we are calling exeternal contract function


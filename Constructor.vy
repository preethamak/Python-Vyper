# pragma version 0.4.0
# @license MIT

owner: public(address)
name: public(String[100])
time_Stamp: public(uint256)

@deploy
def __init__(name_new: String[100], duration: uint256):
    self.owner = msg.sender
    self.name = name_new
    self.time_Stamp = block.timestamp + duration

'''Constructor is the special fucntion in vyper, which is called only once at the time of the deployment of the smart contract, 
It is initialised with the special keyword, __init__():, And also we use @deploy decorator only for the constructor.
In contrstuctor, we declare state variables, Setting the address of the owner etc.
'''

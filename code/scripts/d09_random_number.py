from brownie import RandomNumber, RandomNumberAttack, accounts, network
from brownie.network.state import TxHistory


def main():
    owner = accounts[0]
    attacker = accounts[1]

    random_number = RandomNumber.deploy({"from": owner})
    random_attack = RandomNumberAttack.deploy({"from": attacker})

    history = TxHistory().copy()
    tx = history[0]

    solution = random_attack.guessTheNumber(tx.block_number, tx.timestamp)
    print(random_number.guessTheNumber(solution))

    network.disconnect()

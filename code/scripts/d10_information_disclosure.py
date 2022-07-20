from brownie import MyData, accounts, network, web3


def main():
    owner = accounts[0]
    data = MyData.deploy("0x4f6465642044696b6c6120526f6d616e", {"from": owner})

    breakpoint()

    slot0 = web3.eth.get_storage_at(data.address, 0)
    slot1 = web3.eth.get_storage_at(data.address, 1)
    slot2 = web3.eth.get_storage_at(data.address, 2)

    print(f"on slot 0 we have the variables age(4 bytes) owner(20 bytes) : {slot0[0]} {slot0[1:].hex()}")
    print(f"on slot 1 we have the variable password(32 bytes) : {slot1.hex()}")
    print(f"on slot 0 we have the variables secret(32 bytes) : {slot2.hex()}")

    network.disconnect()

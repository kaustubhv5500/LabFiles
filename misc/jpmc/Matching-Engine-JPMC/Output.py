import pandas as pd
def printOutput(sellOrder,buyOrder,trans):
    if(sellOrder.empty==False):
        print("___________________________________Status Of All SellOrders___________________________________")
        print(sellOrder, "\n")
    else:
        print("There are no SellOrders!")
    if(buyOrder.empty==False):
        print("___________________________________Status Of All BuyOrders____________________________________")
        print(buyOrder, "\n")
    else:
        print("There are no BuyOrders!")

    
    if(trans.empty==True):
        print("___________________________________No New Transaction Occured!__________________________________")
        transaction = pd.read_csv("Transaction.csv")
        if(transaction.empty==False):
            print("_____________________________________Previous Transactions______________________________________")
            print(transaction)
    else:
        print("______________________________________Transaction Occured!______________________________________")
        trans.to_csv("Transaction.csv",mode='a', sep=",", index=False,header=None)
        transaction = pd.read_csv("Transaction.csv")
        print("______________________________________List of Transactions______________________________________")
        print(transaction)
    
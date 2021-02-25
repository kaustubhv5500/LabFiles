import pandas as pd
import time
from Matching import matching
from flask import redirect,url_for


def remove():
    print('123')
    sellOrders = pd.read_csv("Sellorders.csv")
    buyOrders = pd.read_csv("Buyorders.csv")
    sellOrders.loc[sellOrders.status == "pending", "status"] = 'cancelled'
    sellOrders.to_csv("Sellorders.csv", sep=",", index=False)
    buyOrders.loc[buyOrders.status == "pending", "status"] = 'cancelled'
    buyOrders.to_csv("Buyorders.csv", sep=",", index=False)
    print("In remove function")


# if __name__ == "__main__":
#     print("Done")

# schedule.every().day.at("15:30").do(remove)
# schedule.every().day.at("09:15").do(matching) 
# while True:
#     schedule.run_pending()
#     time.sleep(1)


    
    
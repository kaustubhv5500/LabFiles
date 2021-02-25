import pandas as pd
import numpy as np
from Output import *
from fetchPrices import getCurrentPrice
from flask import redirect,url_for

def matching():
    print("123")
    sellorders = pd.read_csv("Sellorders.csv")
    buyorders = pd.read_csv("Buyorders.csv")
    transactions = pd.DataFrame(columns = ['buy_customer_id', 'sell_customer_id', 'quantity', 'stock_code', 'price', 'buy_order_id', 'sell_order_id'])

    i = 0
    buyorder_list = buyorders[(buyorders.status == "pending")]
    while i < buyorder_list.shape[0]:    
        sellorder_list = sellorders[(sellorders.status == "pending") & (sellorders.stock_code == buyorder_list.iloc[i].stock_code)]
        if np.sum(sellorder_list['pending_quantity']) >= buyorder_list.iloc[i].pending_quantity:
            for j in range(sellorder_list.shape[0]): # Iterate over market sell orders until the buy order is completely satisfied

                pending_buyorder = buyorders.loc[(buyorder_list.iloc[i].order_id == buyorders.order_id), 'pending_quantity'].iloc[0]
                transaction_quantity = min(pending_buyorder, sellorder_list.iloc[j].pending_quantity)
                pending_quantity = sellorder_list.iloc[j].pending_quantity - pending_buyorder
                buyorders.loc[(buyorder_list.iloc[i].order_id == buyorders.order_id), 'pending_quantity'] = max(0, -(pending_quantity))
                sellorders.loc[(sellorder_list.iloc[j].order_id == sellorders.order_id), 'pending_quantity'] = max(0, pending_quantity)                
                transaction = {'buy_customer_id': buyorder_list.iloc[i].customer_id, 'sell_customer_id': sellorder_list.iloc[j].customer_id,
                               'quantity': transaction_quantity, 'stock_code' : sellorder_list.iloc[j].stock_code, 
                               'price': getCurrentPrice(str(sellorder_list.iloc[j].stock_code)), 'buy_order_id': buyorder_list.iloc[i].order_id,
                               'sell_order_id': sellorder_list.iloc[j].order_id}
                transactions = transactions.append(transaction, ignore_index=True)
                
                if sellorders.loc[(sellorder_list.iloc[j].order_id == sellorders.order_id), 'pending_quantity'].iloc[0] == 0:
                    sellorders.loc[sellorder_list.iloc[j].order_id == sellorders.order_id, 'status'] = 'completed'
                if buyorders.loc[(buyorder_list.iloc[i].order_id == buyorders.order_id), 'pending_quantity'].iloc[0] == 0:
                    buyorders.loc[(buyorder_list.iloc[i].order_id == buyorders.order_id), 'status'] = 'completed'
                    i += 1
                    break
        else:
            buyorder_list = buyorder_list[buyorder_list['stock_code'] != buyorder_list.iloc[i].stock_code]

    convert_dict = { # Had to add this to prevent the columns from converting to float
        "buy_customer_id": "int64",
        "sell_customer_id": "int64",
        "quantity": "int64",
        "stock_code": "int64",
        "price": "float64",
        "buy_order_id": "int64",
        "sell_order_id": "int64"
    }

    transactions = transactions.astype(convert_dict)
    printOutput(sellorders,buyorders,transactions)
    buyorders.to_csv("Buyorders.csv", sep=",", na_rep="NaN", index=False)
    sellorders.to_csv("Sellorders.csv", sep=",", na_rep="NaN", index=False)\

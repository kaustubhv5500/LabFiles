#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd

txn = pd.read_excel(r'JPMCFiles/txn.xlsx')
account = pd.read_excel(r'JPMCFiles/account.xlsx')


# In[7]:


txn


# In[41]:


account


# In[28]:


no_txn = account.loc[~account['account_id'].isin(txn['account_id'])]
print('Accounts with no transactions : ')
no_txn


# In[40]:


no_credit = txn.loc[txn['dr_cr'] != 'C']
no_credit_account = account.loc[~account['account_id'].isin(no_credit['account_id'])]
print('Accounts with no credit transactions: ')
no_credit_account


# In[51]:


import datetime as dt
accounts_2019 = account.loc[account['open_date'].dt.year == 2019]
print('Transactions of Accounts which were opened in 2019')
txn_accounts_2019 = txn.loc[txn['account_id'].isin(accounts_2019['account_id'])]
txn_accounts_2019


# In[53]:


invalid_txn = txn.loc[~txn['account_id'].isin(account['account_id'])]
print('Transactions where account id is invalid : ')
invalid_txn


# In[ ]:





# -*- coding: utf-8 -*-
"""
Created on Tue Jun 16 14:47:45 2020

@author: Rucha Nargunde
"""

# Install beautifulsoup4, lxml, requests libraries using pip
# Then use command pip install bsedata

from bsedata.bse import BSE

def getCurrentPrice(stockCode):   # stockCode must be a code in String, eg. '500325'
	if(type(stockCode) != str):
		return 'Stock code should be a string'

	b = BSE(update_codes = True)

	try:
		stockDetails = b.getQuote(stockCode)
		return stockDetails['currentValue']
	except AttributeError:
		return 'Not a valid stock code'

#print(getCurrentPrice("500247"))
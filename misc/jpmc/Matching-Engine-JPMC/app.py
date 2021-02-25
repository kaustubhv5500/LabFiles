from flask import Flask,request,jsonify,url_for,render_template,redirect,logging
import json
import pandas as pd
import csv
import datetime
import subprocess
from bsedata.bse import BSE
from csv import DictWriter
from forms import inputOrderForm
from Matching import matching
from Cancellation import remove
from flask_apscheduler import APScheduler
from apscheduler.schedulers.background import BackgroundScheduler

b=BSE()
b.updateScripCodes()
data = {}
with open('./stk.json', 'r') as f:
    data = json.load(f)
with open('static/stk.json', 'w') as f:
    json.dump(data, f)

app = Flask(__name__)
scheduler = APScheduler()
scheduler.init_app(app)
scheduler.start()
scheduler.add_job(id="remove" ,func = remove, trigger = 'cron',day_of_week='mon-sun',hour=15,minute=30)
scheduler.add_job(id="matching" ,func = matching, trigger = 'cron', day_of_week='mon-sun',hour=9,minute=15)

app.config['SECRET_KEY'] = 'secret'
day = datetime.datetime.now().strftime("%w")

def append_dict_as_row(file_name, dict_of_elem, field_names):
    with open(file_name, 'a+', newline='') as write_obj:
        dict_writer = DictWriter(write_obj, fieldnames=field_names)
        dict_writer.writerow(dict_of_elem)


@app.route('/transactions',methods=['GET','POST'])
def show_transaction():
    time_valid = [True]
    currentTime = datetime.datetime.now()
    startTime = datetime.time(9, 15, 0)
    endTime = datetime.time(15, 30, 0)
    if(int(day)!=0 and int(day)!=6):
        if (currentTime.time() < endTime and currentTime.time() > startTime):
            time_valid[0] = True
        else:
            time_valid[0] = False
    else:
        time_valid[0] = False
    form = inputOrderForm()
    transaction_data = []
    input_file = csv.DictReader(open("Transaction.csv"))
    for row in input_file:
        transaction_data.append(row)
    return render_template('transaction.html',transaction_data = transaction_data ,form=form, time_valid=time_valid)

@app.route('/',methods=['GET','POST'])
@app.route('/placeOrders',methods=['GET','POST'])
def get_orders():
    form = inputOrderForm()
    buy_data = []
    sell_data = []
    time_valid = [True]
    max_buyorder_id = 0
    max_sellorder_id = 0
    input_file = csv.DictReader(open("Buyorders.csv"))
    for row in input_file:
        if(max_buyorder_id < int(row['order_id'])):
            max_buyorder_id = int(row['order_id'])
        buy_data.append(row)
    input_file = csv.DictReader(open("Sellorders.csv"))
    for row in input_file:
        if(max_sellorder_id < int(row['order_id'])):
            max_sellorder_id = int(row['order_id'])
        sell_data.append(row)
    currentTime = datetime.datetime.now()
    startTime = datetime.time(9, 15, 0)
    endTime = datetime.time(15, 30, 0)
    print(int(day))
    if(int(day)!=0 and int(day)!=6):
        if (currentTime.time() < endTime and currentTime.time() > startTime):
            time_valid[0] = True
        else:
            time_valid[0] = False
    else:
        time_valid[0] = False
    print(time_valid)
    if request.method =='POST':
        order_dict = form.data
        trade_type = order_dict['trade_type']
        del order_dict['csrf_token']
        del order_dict['submit']
        order_dict['status'] = 'pending'
        if order_dict['trade_type']=='buy':
            order_dict['order_id'] = max_buyorder_id+1
            order_dict['flavour'] = 'all/none'
        else:
            order_dict['order_id'] = max_sellorder_id + 1
            order_dict['flavour'] = 'partial'
        del order_dict['trade_type']
        order_dict['pending_quantity'] = form.quantity.data
        append_dict_as_row(trade_type.title()+'orders.csv',order_dict,['order_id','quantity','pending_quantity','stock_code','customer_id','order_type','flavour','status'])
        if ((currentTime.time() < endTime) and (currentTime.time() > startTime) and int(day)!=0 and int(day)!=6):
            time_valid[0] = True
            matching()
        else:
            time_valid[0] = False
        return redirect(url_for('get_orders'))
    print(time_valid)
    return render_template("orders.html", buy_data = buy_data , sell_data = sell_data , form=form, time_valid=time_valid)


if __name__ == '__main__':
    app.run(debug = True)


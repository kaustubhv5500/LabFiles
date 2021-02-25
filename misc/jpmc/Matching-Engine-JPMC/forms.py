from wtforms import StringField,IntegerField,ValidationError,SelectField,SubmitField
from flask_wtf import FlaskForm
from wtforms.validators import Length,DataRequired

class inputOrderForm(FlaskForm):
    quantity = IntegerField("Enter the quantity",validators=[DataRequired()])
    stock_code = StringField("Enter the stock code",validators=[DataRequired()])
    customer_id = IntegerField("Enter the Customer ID",validators=[DataRequired()])
    trade_type = SelectField("Enter the trade type",validators=[DataRequired()],choices=[('buy','Buy'),('sell','Sell')])
    order_type = SelectField("Order type",validators=[DataRequired()],choices=[('market','Market')]) 
    submit = SubmitField("Submit")
    # def check_stockcode(self,field):
    #     if type(field.data) is not type(""):
    #           raise ValidationError('Stockcode is a string.')

    # def check_quantity(self,field):
    #     if field.data < 1:
    #         raise ValidationError('Quantity needs to be greater than 0.')

    # def check_customerid(self,field):
    #     if type(field.data) is not type(1):
    #         raise ValidationError('Customer ID is an integer') 



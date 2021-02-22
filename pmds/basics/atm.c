//Program to simulate an ATM 

#include<stdio.h>

void main()
{

int ch;
double balance=5000,op=0;

do
{

printf("Enter the Operation to be performed:\n1.Deposit\n2.Withdraw\n3.Check Balance\n4.Exit\n");
scanf(" %d",&ch);

switch(ch)
{
case 1: 
printf("Enter the amount to be deposited\n");
scanf(" %lf",&op);
balance+=op;
break;

case 2:
printf("Enter the amount to be withdrawn\n");
scanf(" %lf",&op);

if(op>balance)
{
printf("Insufficient Funds\n");
}
else
{
balance-=op;
}
break;

case 3:
printf("The balance in the account is: %lf\n",balance);
break;

case 4:
;
break;

default:
printf("Enter the correct operation number\n");
break;
}

}
while(op!=4);
}




#include<stdio.h>

void main()
{
long int num2000,num500,num200,num100,num50,num20,num10,num5;
long int tot=0;

printf("Enter the Number of 2000 Rupees Notes\n");
scanf("%li",&num2000);
tot+=num2000*2000;


printf("Enter the Number of 500 Rupees Notes\n");
scanf("%li",&num500);
tot+=num500*500;


printf("Enter the Number of 200 Rupees Notes\n");
scanf("%li",&num200);
tot+=num200*200;


printf("Enter the Number of 100 Rupees Notes\n");
scanf("%li",&num100);
tot+=num100*100;

printf("Enter the Number of 50 Rupees Notes\n");
scanf("%li",&num50);
tot+=num50*50;

printf("Enter the Number of 20 Rupees Notes\n");
scanf("%li",&num20);
tot=tot+num20*20;

printf("Enter the Number of 10 Rupees Notes\n");
scanf("%li",&num10);
tot+=num10*10;

printf("Enter the Number of 5 Rupees Notes\n");
scanf("%li",&num5);
tot+=num5*5;

printf("The Total Amount is:%li\n",tot);
}






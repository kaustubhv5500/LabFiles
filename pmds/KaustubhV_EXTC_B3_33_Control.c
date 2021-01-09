#include<stdio.h>

void main()
{

int n;
double reduced=0,price,tobeadded=0,final=0;

printf("Enter the number of products\n");
scanf(" %d",&n);

for(int i=0;i<n;i++)
{


	printf("Enter the price of the product\n");
	scanf(" %lf",&price);

	reduced=price*0.9;
	tobeadded=(100.00)-(((int)reduced)%(100));
	final=reduced+tobeadded-1;

	if(final<price)
	{
		printf("The Final Price of the product is: %d\n",(int)final);
	}
	else
	{
		printf("WARNING THE RESULTANT PRICE WAS GREATER THAN THE ORIGINAL PRICE\n");
		printf("The Final Price of the product is: %lf\n",price);
	}
}
}



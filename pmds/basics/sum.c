//Program to find sum of n numbers input by the user


#include<stdio.h>

void main()
{

int n;

printf("Enter the number of Numbers \n");
scanf(" %d",&n);

float num,tot=0;
int i=0;

while(i<n)
{

printf("Enter the number to be added\n");
scanf(" %f",&num);

tot+=num;
i++;
}

printf("The total Sum of all the numbers is: %f\n",tot);
}







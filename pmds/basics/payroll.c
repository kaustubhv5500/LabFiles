//Program to determine the wages of workers in a company

#include<stdio.h>

void main()

{
int num;
double rate,tot=0;
double hours=0;

printf("Enter the number of Workers\n");
scanf(" %d",&num);

for(int i=0;i<num;i++)
{
printf("Enter the rate for the current employee\n");
scanf(" %lf",&rate);

printf("Enter the number of hours worked by the employee\n");
scanf(" %lf",&hours);

tot+=rate*hours;
}

printf("The total Salary of all the workers is: %lf\n",tot);

}

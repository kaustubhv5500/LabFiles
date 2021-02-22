//Program to find if a number is odd or even

#include<stdio.h>
#include<ctype.h>

void main()
{
int n;
char op='Y';

printf("Enter the number to be checked\n");
scanf("%d",&n);

if(n%2==0)
{
printf("The number %d is Even\n",n);
}
else
{
printf("The number %d is Odd\n",n);
}
}


/*Date-18/9/18

Kaustubh V
EXTC B3
Roll No.:33

Experiment 3:Functions
Program 3. Write a function which takes as parameters two positive integers and returns TRUE if the
numbers are amicable and FALSE otherwise. A pair of numbers is said to be amicable if the sum
of the divisors of each of the numbers (excluding the no. itself) is equal to the other number. Ex.
1184 and 1210 are amicable.
*/

//Aim:To write a function to find out whether a given pair of numbers is amicable or not


#include<stdio.h>


int amicable(int num1,int num2)  			//Function to find out if the given integer arguments are amicable or not
{

	int i,j;
	int sum1=1,sum2=1;

	for(i=2;i<num1;i++) 					//Loop to find the sum of the divisors of number 1
	{
		if(num1%i==0)
		{
			sum1+=i;
		}
	}
	
	for(j=2;j<num2;j++)  					//Loop to find the sum of the divisors of number 2
	{
		if(num2%j==0)
		{
			sum2+=j;
		}
	}
	
	
	
	if((sum1==num2)&&(sum2==num1))			//statement to check whether the sum of the divisors is equal to the number
	{
		return 1;    						//Function returns 1 if the numbers are amicable
	}
	else
	{
		return 0;							//Function returns 0 if the numbers are not amicable
	}
	
}


void main()
{
	int a,b;
	int check=1;
	char op;
	
do
{
	printf("Enter the numbers which have to be checked if the are Amicable\n");
	scanf("%d%d",&a,&b);
	
	check=amicable(a,b); 					//Variable assigned the value returned by the fucntion
	
	if(check==1)
	{
		printf("TRUE! The Numbers %d and %d are Amicable\n",a,b);
	}
	else if(check==0)
	{
		printf("FALSE! The Numbers %d and %d are NOT Amicable\n",a,b);
	}
	
	printf("Do you want to continue? Enter Y or N\n");
	scanf(" %c",&op);
}
	while((op=='Y')||(op=='y'));
}	


/*
Output:


spit@CAD-Lab-203-U15:~$ cd Desktop
spit@CAD-Lab-203-U15:~/Desktop$ gcc amicable.c
spit@CAD-Lab-203-U15:~/Desktop$ ./a.out
Enter the numbers which have to be checked if the are Amicable
1184
1210
TRUE! The Numbers 1184 and 1210 are Amicable
Do you want to continue? Enter Y or N
y
Enter the numbers which have to be checked if the are Amicable
220
284
TRUE! The Numbers 220 and 284 are Amicable
Do you want to continue? Enter Y or N
y
Enter the numbers which have to be checked if the are Amicable
2620
2924
TRUE! The Numbers 2620 and 2924 are Amicable
Do you want to continue? Enter Y or N
y
Enter the numbers which have to be checked if the are Amicable
1
3
FALSE! The Numbers 1 and 3 are NOT Amicable
Do you want to continue? Enter Y or N
y
Enter the numbers which have to be checked if the are Amicable
6368
6232
TRUE! The Numbers 6368 and 6232 are Amicable
Do you want to continue? Enter Y or N
y
Enter the numbers which have to be checked if the are Amicable
57843
8935
FALSE! The Numbers 57843 and 8935 are NOT Amicable
Do you want to continue? Enter Y or N
n
spit@CAD-Lab-203-U15:~/Desktop$ 
*/
	
	
	
	
			

/* Name:Kaustubh Venkatesh
 Batch B3
 FE EXTC
 Roll No.:33 
Question : 4. In Italy, banknotes are issued for 50000, 20000, 10000, 5000, 2000, 1000 and 500 lire, coins
are available for 100,50,20,10 and 5 lire. Write a program which reads in any sum of money and
prints out a breakdown into the smallest possible number of notes and coins needed to make it
up. Your program should print an error message if the sum is over 2000000 or not a multiple of
5*/




//AIM: Program to find out the minimum number of notes to make up the sum of money entered by the user

#include<stdio.h>

void main()
{

int denom[12]={50000,20000,10000,5000,2000,1000,500,100,50,20,10,5};

int num[12];

int flag=1;

int sum,temp;

printf("Enter the Total sum of money\n");
scanf("%d",&sum);

temp=sum;

for(int i=0;i<=11;i++) //initializes all array elements to zero
num[i]=0;


for(int i=0;i<=11;i++)   //Loop to find the number of notes for each denomination
{
	if((sum>2.0E6)||(sum%5!=0))
	{
		printf("!!ERROR!!!ENTER CORRECT VALUE!!!\n");
		flag=0;
		break;
	}

	if(temp>=denom[i])
	{
		num[i]=temp/denom[i];
		temp%=denom[i];
	}
}


for(int i=0;i<=11;i++)   //Loop to print the number of notes and coins required
{	
	if(flag==0)
	break;
	
	if(i<=6)
 	printf("The Number of %i lire Notes Required is: %d\n",denom[i],num[i]);
 	else
 	printf("The Number of %i lire Coins Required is: %d\n",denom[i],num[i]);
}

}

/*spit@CAD-Lab-203-U17:~$ cd Desktop
spit@CAD-Lab-203-U17:~/Desktop$ gcc notes.c
spit@CAD-Lab-203-U17:~/Desktop$ ./a.out
Enter the Total sum of money
45675
The Number of 50000 lire Notes Required is: 0
The Number of 20000 lire Notes Required is: 2
The Number of 10000 lire Notes Required is: 0
The Number of 5000 lire Notes Required is: 1
The Number of 2000 lire Notes Required is: 0
The Number of 1000 lire Notes Required is: 0
The Number of 500 lire Notes Required is: 1
The Number of 100 lire Coins Required is: 1
The Number of 50 lire Coins Required is: 1
The Number of 20 lire Coins Required is: 1
The Number of 10 lire Coins Required is: 0
The Number of 5 lire Coins Required is: 1
spit@CAD-Lab-203-U17:~/Desktop$ ^C
spit@CAD-Lab-203-U17:~/Desktop$ 
*/		
		
		
		
		

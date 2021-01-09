#include<stdio.h>
#include<string.h>

struct emp
{
	char name[100];
	double amount;
	int age;
	char sal;
};

double Week(struct emp obj[],int num)
{	
	int weekamt=0;
	
	for(int i=0;i<num;i++)
	{
		if(obj[i].sal=='W')
		{
			weekamt+=obj[i].amount;
		}
	}
return weekamt;
}

int Weeknum(struct emp obj[],int num)
{
	int weeknum=0;
	
	for(int i=0;i<num;i++)
	{
		if(obj[i].sal=='W')
		{
			weeknum++;
		}
	}
return weeknum;
}


double Month(struct emp obj[],int num)
{	
	int monthamt=0;
	
	for(int i=0;i<num;i++)
	{
		if(obj[i].sal=='M')
		{
			monthamt+=obj[i].amount;
		}
	}
return monthamt;
}


int Monthnum(struct emp obj[],int num)
{
	int monthnum=0;
	
	for(int i=0;i<num;i++)
	{
		if(obj[i].sal=='W')
		{
			monthnum++;
		}
	}
return monthnum;
}

void Read(struct emp obj[],int num)
{
	char temp[100];
	for(int i=0;i<num;i++)
	{
		printf("Enter the name of the employee\n");
		//scanf("%s",obj[i].name);
		fgets(temp,100,stdin);
		getchar();
		fflush(stdin);
		//scanf("%s",temp);
		strcpy(obj[i].name,temp);
		printf("Enter the age of the employee\n");
		scanf("%d",&obj[i].age);
		
		
		printf("Enter the Type of Salary: W for Weekly or M for Monthly\n");
		scanf(" %c",&obj[i].sal);
		
		
		printf("Enter the Amount of Salary\n");
		scanf("%lf",&obj[i].amount);
		
	}
}

void Disp(struct emp obj[],int num)
{

	double weekamount=Week(obj,num);
	int weeknum=Weeknum(obj,num);
	double monthamount=Month(obj,num);
	int monthnum=Monthnum(obj,num);
	double totalsal=(12*monthamount)+(52*weekamount);

	printf("The Total Weekly Wages of the Employees is: %lf\n",weekamount);
	printf("The Total Monthly Wages of the Employees is: %lf\n",monthamount);
	printf("The Total Yearly Wages of all the employees is: %lf\n",totalsal);
	printf("The Number of Employees earning Weekly Wages is: %d\n",weeknum);
	printf("The Number of Employees earning Monthly wages is: %d\n",monthnum);
}


void main()
{
struct emp obj[100];
int num;

printf("Enter the number of Employees\n");
scanf("%d",&num);

Read(obj,num);
Disp(obj,num);

}
	

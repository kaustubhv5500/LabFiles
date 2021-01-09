/*
Name: Kaustubh Venkatesh
Batch B3
Roll Number: 33
AIM: Program to implement Linked Lists and use it to store the details of students in a class
*/


#include<stdio.h>
#include<stdlib.h>
#include<string.h>


struct student
{
	int rollno;
	float marks;
	char name[50];
	struct student *next;
};

void disp(struct student*);



struct student* insert_infront(struct student *head)  //Function to insert a node in front of the linked list
{
	
	struct student *nn;
	nn=malloc(sizeof(struct student));	
	nn->next=NULL;
	
	printf("Enter the Roll Number of the student\n");
	scanf("%d",&nn->rollno);
	
	printf("Enter the Name of the Student\n");
	scanf("%s",nn->name);

	printf("Enter the total marks of the student\n");
	scanf("%f",&nn->marks);

	nn->next=head;
	head=nn;

return head;
}

 //Function to compute the average marks of all the students and print the details of those whose marks is greater than the average
void average(struct student *head) 
{	
		float avg=0;
		int n=0;
		int j=0;
	
	
		struct student *tmp;
	
		for(tmp=head;tmp!=NULL;tmp=tmp->next)		//Traversing through the linked list
		{
			n++;
			avg+=tmp->marks;
		}

		avg/=n;

printf("The Details of the students having total marks above the class average (%f) is:\n",avg);
	

	for(struct student *tmp=head;tmp!=NULL;tmp=tmp->next)
	{
		if((tmp->marks)>avg)
		{	
			j++;
			disp(tmp);
		}
	}
}

void disp(struct student *head)  //Function to display the details of the students
{
	
		printf("The Roll Number of the student is : %d\n",head->rollno);
		printf("The Name of the student is: %s \n",head->name);
		printf("The total marks of the student is : %f\n",head->marks);

}

int main()
{
	struct student *head=NULL;
	
	float avg;
	int n;
	
	printf("Enter the number of students \n");
	scanf("%d",&n);

	for(int i=0;i<n;i++)
	{
		head=insert_infront(head);
	}

	average(head);
		
	return 0;
}

		








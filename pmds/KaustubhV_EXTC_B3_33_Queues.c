//Experiment 8: QUEUES

/*	Kaustubh Venkatesh
	FE EXTC
	Batch:B3
	Roll No.:33
	Date:6/11/18
	AIM: To use the concepts of queues to simulate the working of a printer
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>



struct node
{
	char data[40];
	struct node *next;
};

struct queue
{
	struct node *front,*rear;
};

void ins_queue(struct queue *pq,char string[])   //Function to insert a document in the front of a printer queue
{

	struct node *nn=malloc(sizeof(struct node));


	if(nn==NULL)
	{
		printf("Queue Overflow\n");
	}
	else if(pq->front==NULL)
	{
		strcpy(nn->data,string);
		pq->front=pq->rear=nn;
	}
	else
	{
		strcpy(nn->data,string);
		pq->rear->next=nn;
		pq->rear=nn;
	}
}



void del_queue(struct queue *pq)    //Function to print a document from the front of the print queue
{
	if(pq->front==NULL)
	{
		printf("Queue Underflow\n");
	}
	else
	{
		struct node *temp;
		
		printf("\n...Printing the following Document:\n");
		puts(pq->front->data);
		
		temp=pq->front;
		pq->front=pq->front->next;
		free(temp);
	}
	
	if(pq->front==NULL)
	{
	pq->front=pq->rear=NULL;
	}
}


void main()
{

		char *string=malloc(sizeof(char)*40);
		struct queue p;
		
		int op;
		
		p.front=NULL;
		p.rear=NULL;

		do
		{
		
		//Menu to allow the user to choose to add or print a document from the printer queue
		
		printf("MENU\nEnter the corresponding operation number for:\n1.Add a document to the queue\n");
		printf("2.Print a document from the start of the print queue\n3.Exit\n\n\n");
		scanf("%d",&op);
		
		switch(op)
		{
		case 1:
		printf("Enter the Data in the document to be printed\n");
		getchar();
		fgets(string,40,stdin);
		ins_queue(&p,string);       //Calling function to insert a document in the printer queue 
		break;
		
		
		case 2:                   //Calling function to print a document to delete from the printer queue
		del_queue(&p);
		break;	
		
		case 3: 
		printf("Exiting...\n");
		exit(0);
		break;
		
		default:
		printf("Enter the correct opeartion number\n");
		break;
		}
		}	
		while(op!=3);
	}
	
	
/*  OUTPUT
itlab@PG-Lab-410-07:~/Desktop$ gcc EXTC_B3_KaustubhV_33_Queues.c
itlab@PG-Lab-410-07:~/Desktop$ ./a.out
MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


1
Enter the Data in the document to be printed
hello
MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


1
Enter the Data in the document to be printed
world
MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


1
Enter the Data in the document to be printed
whatsup
MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


2

...Printing the following Document:
hello

MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


2

...Printing the following Document:
world

MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


2

...Printing the following Document:
whatsup

MENU
Enter the corresponding operation number for:
1.Add a document to the queue
2.Print a document from the start of the print queue
3.Exit


3
Exiting...
itlab@PG-Lab-410-07:~/Desktop$ 
*/
	
		

	



/*Kaustubh Venkatesh
  EXTC B3 33
  Stacks using Linked Lists		
  30/10/18	*/




#include<stdio.h>
#include<stdlib.h>

struct node
{
	int ele;
	struct node *next;
};

int eval(char,int,int);


struct node *push(struct node *top,int num)  //Function to push an element into the stack
{	
	struct node *nn=malloc(sizeof(struct node));
		
	if(nn==NULL)
	{
		printf("Stack Overflow\n");
	}
	else
	{	
		nn->ele=num;
		nn->next=top;
		top=nn;
	}
return top;
}


struct node *pop(struct node *top)			//Function to pop an element from a stack
{
	
	if(top==NULL)
	{
		printf("Stack Underflow\n");
	}
	else
	{
	struct node *tmp;
	tmp=top;
	printf("The element deleted is: %d\n",top->ele);
	top=top->next;
	free(tmp);
	}

return top;
}


int peek(struct node *top)		//Fucntion to peek an element from the stack
{
	if(top==NULL)
	{
		printf("Stack Underflow\n");
		return -1;
	}
	else
	{
		return top->ele;
	}
}
	


int eval_post(char post[])		//Function to evaluate the given postfix expression
{
	int i;
	struct node *top;
	
	int num1,num2,res;
		
	for(int i=0;post[i]!='\0';i++)
	{
		if((post[i]>='0')&&(post[i]<='9'))
		{
			top=push(top,(int)(post[i]-'0'));
		}

		
		else
		{
			num2=peek(top);
			top=pop(top);
			num1=peek(top);
			top=pop(top);
	 		res=eval(post[i],num1,num2);
			top=push(top,res);
		}
	}
return top->ele;
}



int eval(char opr,int op1,int op2)		//Function to evaluate a particular opearation in the postfix evaluation
{
	switch(opr)
	{
		case '*':
		return op1*op2;
		break;
		case '/':
		return op1/op2;
		break;
		case '+':
		return op1+op2;
		break;
		case '-':
		return op1-op2;
		break;
	}
}


	  	  
int main()
{
	
	char postfix[100];

	printf("Enter the Postfix expression to be evaluated\n");
	scanf(" %s",postfix);

	printf("The result of the postfix expression is: %d\n",eval_post(postfix));

return 1;
}


/* OUTPUT
itlab@PG-Lab-410-07:~/Desktop$ ./a.out
Enter the Postfix expression to be evaluated
67+33+83*54/
The element deleted is: 7
The element deleted is: 6
The element deleted is: 3
The element deleted is: 3
The element deleted is: 3
The element deleted is: 8
The element deleted is: 4
The element deleted is: 5
The result of the postfix expression is: 1
*/



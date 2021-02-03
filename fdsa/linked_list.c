#include<stdio.h>
#include<stdlib.h>

struct node
{
	int data;
	struct node *next;
};

int size = 0;

struct node* insert_front(struct node *head, int new_data){
	struct node *nn;
	nn = malloc(sizeof(struct node));	
	nn->next = NULL;

	nn->data = new_data;
	nn->next = head;
	head = nn;
	size++;

	return head;
}

struct node* insert_after(struct node* head, int position, int new_data)  
{  
   	
   	struct node *current = head;

    if (head == NULL){  
    printf("Linked List Empty!\n");      
    }

    if(position < 1 || position > size + 1){
    	printf("Invalid Position\n");
    }
    else{
    	while(position--){

    		if(position == 0){
    			struct node *temp;
				temp = malloc(sizeof(struct node));
				temp->data = new_data;
				temp->next = current;
				current = temp;
			}
			current = current->next;
    	}
    }

    return head;
}

struct node* insert_end(struct node* head, int new_data){
    struct node* new_node = (struct node*) malloc(sizeof(struct node)); 
  
    struct node *last =head; 
    new_node->data  = new_data; 
  
    new_node->next = NULL; 
  
    if (head == NULL) 
    { 
       head = new_node; 
    }   
       
    while (last->next != NULL) 
        last = last->next; 
   
    last->next = new_node; 
    return head;   
}

void display_ll(struct node* head){
	printf("Status of Linked List : \n");
	while(head != NULL){
		printf("%d ",head->data);
		head = head->next;
	}
	printf("\n");
}

int main(){
	struct node* head = NULL;
	int opcode, data, position;

	do{
		printf("Enter the Opcode : \n1.Insert in front\n2.Insert after given position\n3.Insert at end\n4.Display Linked List\n0.Exit\n");
		scanf("%d",&opcode);
		switch(opcode){
			case 1: 
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);
			head = insert_front(head,data);
			break;
			case 2:
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);
			printf("Enter the position\n");
			scanf("%d",&position);
			head = insert_after(head,position,data);
			break;
			case 3:
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);
			head = insert_end(head,data);
			break;
			case 4 : 
			display_ll(head);
			break;
			case 0:
			break;
			default : 
			printf("Enter the correct Opcode\n");
			break;
		}
	}while(opcode);
}


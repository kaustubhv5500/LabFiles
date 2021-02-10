#include<stdio.h>
#include<stdlib.h>

//  structure definition to implement the Linked list
struct node
{
	int data;
	struct node *next;
};

int size = 0; // global variable to store the size of the linked list

// Function to add a node in the front of a Linked list
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

// Function to add node after a given position to a Linked list
struct node* insert_after(struct node* head, int position, int new_data)  
{  
   	
   	struct node *current = head;
   	int curr = 1;

    if (head == NULL){  
    printf("Linked List Empty!\n");      
    }

    if(position < 1 || position > size + 1){
    	printf("Invalid Position\n");
    }

    
    while(curr != position){
    	current = current->next;
    	curr++;
    }

    struct node *temp;
	temp = malloc(sizeof(struct node));
	temp->data = new_data;
	temp->next = current->next;
	current->next = temp;

	size++;
    return head;
}

// Function to add a node at the end of the Linked list
struct node* insert_end(struct node* head, int new_data){
    struct node* new_node = (struct node*) malloc(sizeof(struct node)); 
  
    struct node *last = head; 
    new_node->data  = new_data; 
  
    new_node->next = NULL; 
  
    if (head == NULL) 
    { 
       head = new_node; 
    }   
       
    while (last->next != NULL) 
        last = last->next; 
   
    last->next = new_node;

    size++; 
    return head;   
}

struct node* delete_node(struct node* head, int key){

	struct node *temp = head;
	struct node *prev;

	if(temp->data == key){
		head = head->next; 
        free(temp);
        return head;
	}

	while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == NULL)
    {
    	printf("Element Not found\n");
    	return head;
    }
 
    prev->next = temp->next;
    free(temp);

    size--;
    return head;
}

// Function to display the status of the linked list
int display_ll(struct node* head){
	int count = 0;
	printf("Status of Linked List : \n");
	while(head != NULL){
		printf("%d ",head->data);
		head = head->next;
		count++;
	}
	printf("\n");
	return count;
}

int main(){
	struct node* head = NULL;
	int opcode, data, position;

	do{
		printf("Enter the Opcode : \n1.Insert in front\n2.Insert after given position\n3.Insert at end\n4.Display Linked List\n5.Delete Node\n0.Exit\n");
		scanf("%d",&opcode);
		switch(opcode){
			case 1: 
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);

			head = insert_front(head,data);
			display_ll(head);
			break;

			case 2:
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);
			printf("Enter the position\n");
			scanf("%d",&position);

			head = insert_after(head,position,data);
			display_ll(head);
			break;

			case 3:
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);

			head = insert_end(head,data);
			display_ll(head);
			break;

			case 4 : 
			display_ll(head);
			break;

			case 5:
			printf("Enter the data to be deleted\n");
			scanf("%d",&data);
			head = delete_node(head, data);
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


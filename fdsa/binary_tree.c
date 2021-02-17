#include<stdio.h>
#include<stdlib.h>

// structure to implement the Binary Search Tree
struct node
{
	int data;
	struct node *left, *right;
};

// function to add a node to the binary search tree
struct node* insert(struct node* root, int input_data){

	if(root == NULL){

		struct node *temp;
		temp = malloc(sizeof(struct node));
		temp->data = input_data;
		temp->left = temp->right = NULL;
		return temp;
	}
	
	if(input_data < root->data)
		root->left = insert(root->left, input_data);
	else if(input_data > root->data)
		root->right = insert(root->right, input_data);

	return root;

}

// function to perform in-order traversal of the bst
void in_order(struct node* root)
{
    if (root != NULL) {
        in_order(root->left);
        printf("%d  ", root->data);
        in_order(root->right);
    }
}

// function to perform pre-order traversal of the bst
void pre_order(struct node* root)
{
    if (root != NULL) {
        printf("%d  ", root->data);
        pre_order(root->left);
        pre_order(root->right);
    }
}

// function to perform post traversal of the bst
void post_order(struct node* root)
{
    if (root != NULL) {
        post_order(root->left);
        post_order(root->right);
        printf("%d  ", root->data);
    }
}





int main(){
	struct node *root = NULL;
	int opcode, data, trav;

	do{
		printf("Enter the opcode : \n1.Insert to tree\n2.Traverse the tree\n0.Exit\n");
		scanf("%d",&opcode);

		switch(opcode){
			case 1:
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);
			root = insert(root,data);
			break;

			case 2:
			printf("Type of Traversal : \n1.In-Order\n2.Pre-Order\n3.Post-Order\n");
			scanf("%d",&trav);

			printf("Status of Tree : ");

			if(trav == 1)
				in_order(root);
			else if(trav == 2)
				pre_order(root);
			else if(trav == 3)
				post_order(root);
			else
				printf("Invalid Input");

			printf("\n");
			break;

			case 0:
			break;

			default:
			printf("Enter the correct OpCode\n");
			break;

		}
	}while(opcode);

	return 0;	
}

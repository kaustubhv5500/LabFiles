#include<stdio.h>
#include<stdlib.h>

// Structure to implement the avl binary search tree 
struct node{
	int data;
	struct node *left, *right;
	int height;
};

// Function to create a new node for the binary tree
struct node* new_node(int input_data){

	struct node* temp;
	temp = malloc(sizeof(temp));
	temp->data = input_data;
	temp->left = NULL;
	temp->right = NULL;
	temp->height = 1;
	return temp;
}

// Utility function to return the maximum value 
int max(int a, int b){

	if(a > b)
		return a;
	else 
		return b;
}

// Function to return the height of the input node
int height(struct node* root){

	if(root == NULL)
		return 0;
	else 
		return root->height;
}

// function to perform right rotation on the input node
struct node* rotate_right(struct node* root){

	struct node *temp_l = root->left;
	struct node *temp_r = temp_l->right;
	
	temp_l->right = root;
	root->left = temp_r;

	root->height = max(height(root->left),height(root->right)) + 1;
	temp_l->height = max(height(temp_l->left),height(temp_l->right)) + 1;

	return temp_l;
}

// Function to perform left rotation on the inout node
struct node* rotate_left(struct node* root){

	struct node* temp_r = root->right;
	struct node* temp_l = temp_r->left;

	temp_r->left = root;
	root->right = temp_l;

	root->height = max(height(root->left), height(root->right)) + 1;
	temp_r->height = max(height(temp_r->left), height(temp_l->right)) + 1;

	return temp_r;
}

// Function to get the balance factor of a node
int get_factor(struct node* root){

	if(root == NULL)
		return 0;
	else
		return (height(root->left)-height(root->right));
}

struct node* insert_node(struct node* root, int input_data){

	// Perform normal BST insertion
	if (root == NULL)
		return(new_node(input_data));
	if(input_data < root->data)
		root->left = insert_node(root->left, input_data);
	else if(input_data > root->data)
		root->right = insert_node(root->right, input_data);
	else 
		return root;

	root->height = max(height(root->left), height(root->right)) + 1;
	int balance = get_factor(root);

	if(balance > 1 && input_data < root->left->data)
		return rotate_right(root);

	if(balance < -1 && input_data > root->right->data)
		return rotate_left(root);

	if(balance > 1 && input_data > root->left->data){

		root->left =  rotate_left(root->left);
        return rotate_right(root);
	}

	if (balance < -1 && input_data < root->right->data){
        root->right = rotate_right(root->right);
        return rotate_left(root);
    }

    return root;
}

// Function to perform in order traversal of the tree
void in_order(struct node* root)
{
    if (root != NULL) {
        in_order(root->left);
        printf("%d  ", root->data);
        in_order(root->right);
    }
}

int main(){
	struct node *root = NULL;
	int opcode, data;

	do{
		printf("Enter the opcode : \n1.Insert to tree\n2.Traverse the tree\n0.Exit\n");
		scanf("%d",&opcode);

		switch(opcode){
			case 1:
			printf("Enter the data to be inserted\n");
			scanf("%d",&data);
			root = insert_node(root,data);
			break;

			case 2:
			printf("Status of Tree : ");

			in_order(root);

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

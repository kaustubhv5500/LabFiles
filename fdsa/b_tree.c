#include<stdio.h>
#include<stdlib.h>
typedef struct Btree
{

  int data1;
  int data2;
  int data3;
  int splitcounter;
  struct Btree *left;
  struct Btree *mid;

  struct Btree *right;
  struct Btree *last;
}
Node;

Node *root = NULL;

Node *createNode (Node *, int);
void leafNode (int);
Node *insert (Node *, int);
Node *splitRoot (Node *);
Node *split (Node *, int);
Node *createNode (Node * node, int data)
{

  node = (Node *) malloc (sizeof (Node));
  node->splitcounter = 1;
  node->data1 = data;
  node->data2 = 0;
  node->data3 = 0;
  node->left = NULL;
  node->mid = NULL;
  node->right = NULL;
  node->last = NULL;
  return node;
}

void leafNode (int data)
{

  if (root == NULL)

    {

      root = createNode (root, data);
      return;
    }

  Node *temp = root;

  while (temp->left != NULL && temp->mid != NULL)

    {

      if (data < temp->data1)

	temp = temp->left;

      else if (data > temp->data1
	       && (temp->splitcounter == 1 || data < temp->data2))
	temp = temp->mid;
      else

	temp = temp->right;

    }

  temp = insert (temp, data);
  while (temp->splitcounter == 3)
    {

      if (temp == root)

	{

	  temp = splitRoot (temp);
	  root = temp;
	}

      else

	{

	  temp = split (temp, data);

	}

    }

}

Node * insert (Node * node, int data)
{

  if (node->splitcounter == 1)

    {

      if (data < node->data1)

	{

	  node->data2 = node->data1;
	  node->data1 = data;
	}

      else

	{

	  node->data2 = data;

	}

      node->splitcounter = 2;

    }

  else if (node->splitcounter == 2)

    {

      if (data > node->data2)

	node->data3 = data;
      else if (data < node->data1)
	{

	  node->data3 = node->data2;

	  node->data2 = node->data1;
	  node->data1 = data;
	}

      else

	{

	  node->data3 = node->data2;
	  node->data2 = data;
	}

      node->splitcounter = 3;

    }

  return node;

}

Node * splitRoot (Node * node)
{

  Node *temp1 = createNode (temp1, node->data2);

  Node *newbranch = createNode (newbranch, node->data3);
  node->splitcounter = 1;
  temp1->left = node;
  temp1->mid = newbranch;
  newbranch->left = node->right;
  newbranch->mid = node->last;
  node->right = NULL;
  node->last = NULL;
  return temp1;
}

Node * split (Node * node, int data)
{

  Node *temp = root;

  while (temp->left != node && temp->mid != node && temp->right != node)

    {

      if (data < temp->data1)

	temp = temp->left;

      if (data > temp->data1
	  && (temp->splitcounter == 1 || data < temp->data2))
	temp = temp->mid;
      else

	temp = temp->right;

    }

  if (temp->splitcounter == 1)

    {

      if (temp->left == node)

	{

	  temp->data2 = temp->data1;
	  temp->data1 = node->data2;
	  temp->splitcounter = 2;
	  Node *newbranch = createNode (newbranch, node->data3);
	  newbranch->left = node->right;
	  newbranch->mid = node->last;
	  node->right = NULL;
	  node->last = NULL;
	  node->splitcounter = 1;

	  temp->right = temp->mid;
	  temp->mid = newbranch;
	}

      else

	{

	  temp->data2 = node->data2;
	  temp->splitcounter = 2;
	  Node *newbranch = createNode (newbranch, node->data3);
	  node->splitcounter = 1;
	  temp->right = newbranch;
	  newbranch->left = node->right;
	  newbranch->mid = node->last;
	  node->right = NULL;
	  node->last = NULL;

	}

    }

  else

    {

      if (temp->left == node)

	{

	  temp->data3 = temp->data2;
	  temp->data2 = temp->data1;
	  temp->data1 = node->data2;
	  temp->splitcounter = 3;
	  Node *newbranch = createNode (newbranch, node->data3);

	  node->splitcounter = 1;
	  newbranch->left = node->right;
	  newbranch->mid = node->last;
	  node->right = NULL;
	  node->last = NULL;

	  temp->last = temp->right;
	  temp->right = temp->mid;
	  temp->mid = newbranch;
	}

      else if (temp->mid == node)

	{

	  temp->data3 = temp->data2;
	  temp->data2 = node->data2;
	  temp->splitcounter = 3;
	  Node *newbranch = createNode (newbranch, node->data3);
	  newbranch->left = node->right;
	  newbranch->mid = node->last;
	  node->right = NULL;
	  node->last = NULL;
	  node->splitcounter = 1;
	  temp->last = temp->right;
	  temp->right = newbranch;
	}

      else

	{

	  temp->data3 = node->data2;
	  temp->splitcounter = 3;
	  Node *newbranch = createNode (newbranch, node->data3);
	  newbranch->left = node->right;
	  newbranch->mid = node->last;
	  node->right = NULL;
	  node->last = NULL;
	  node->splitcounter = 1;
	  temp->last = newbranch;

	}

    }

  return temp;

}

void traversal (Node * node)
{

  if (node == NULL)
    return;
  traversal (node->left);
  printf ("%d ", node->data1);
  traversal (node->mid);
  if (node->splitcounter == 2)
    {

      printf ("%d\n", node->data2);
      traversal (node->right);
    }

}

void search (Node * node, int data)
{

  if (node->left == NULL)

    {

      if (node->data1 == data || node->data2 == data)

	{

	  printf ("Element found\n");

	}

      else

	printf ("Element not found\n");
      return;
    }

  if (node->splitcounter == 1)

    {

      if (data < node->data1)
	search (node->left, data);
      else if (data > node->data1)
	search (node->mid, data);
      else
	{

	  printf ("Element found\n");
	  return;
	}

    }

  else

    {

      if (data == node->data1 || data == node->data2)

	{

	  printf ("Element found\n");
	  return;
	}

      if (data < node->data1)
	search (node->left, data);
      else if (data > node->data2)
	search (node->right, data);
      else
	search (node->mid, data);

    }

}

int main ()
{

  int choice = 0, element;
  while (choice != 3)
    {

      printf ("\n1.Insert \n2.Search \n3.Exit\n");
      scanf ("%d", &choice);
      switch (choice)

	{

	case 1:
	  printf ("Enter element to be inserted\n");

	  scanf ("%d", &element);
	  leafNode (element);
	  printf("Traversal of the tree is: ");
	  traversal (root);
	  break;
	case 2:
	  printf ("Enter element to be searched\n");

	  scanf ("%d", &element);
	  search (root, element);
	  break;

	case 3:
	  
	  break;
	
	}

    }

  return 0;

}

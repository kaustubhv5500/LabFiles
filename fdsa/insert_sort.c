// C program for insertion sort 
#include <math.h> 
#include <stdio.h> 

/* Function to sort an array using insertion sort*/
void insertionSort(int arr[], int n) 
{ 
	int i, k, j; 
	for (i = 1; i < n; i++) 
	{ 
		k = arr[i]; 
		j = i - 1; 

		while (j >= 0 && arr[j] > k) 
		{ 
			arr[j + 1] = arr[j]; 
			j = j - 1; 
		} 
		arr[j + 1] = k; 
	} 
} 

int main() 
{
    int n,x;
    printf("Enter array size: ");
    scanf("%d", &n);
    int arr[n];
    printf("Enter the elements of the array: \n");

    for(int i=0; i<n; i++)
        scanf("%d", &arr[i]);

    printf("Input Array : ");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);

    insertionSort(arr, n);

    printf("\nSorted Array: ");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);

    return 0;
    
  
}

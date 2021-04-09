// C program for insertion sort 
#include <math.h> 
#include <stdio.h>
#include<time.h> 

/* Function to sort an array using insertion sort*/
void insertionSort(int arr[], int n) 
{ 
	int i, k, j;
	int count = 0;
	int swaps = 0; 
	for (i = 1; i < n; i++) 
	{ 
		k = arr[i]; 
		j = i - 1; 

		while (j >= 0 && arr[j] > k) 
		{ 
			arr[j + 1] = arr[j]; 
			j = j - 1;
			swaps++; 
		} 
		arr[j + 1] = k;
		count++;
		printf("Pass %d : ",i); 
		for(int m = 0;m <= i;m++)
			printf("%d ",arr[m]);
		printf("\n");
	}
	printf("Number of Passes : %d \n",count);
	printf("Number of Swaps : %d \n",swaps); 
} 

int main() 
{
    int n,x;
    double cpu_execution_time;
    clock_t start, end;

    printf("Enter array size: ");
    scanf("%d", &n);
    int arr[n];
    printf("Enter the elements of the array: \n");

    for(int i=0; i<n; i++)
        scanf("%d", &arr[i]);

    printf("Input Array : ");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);
    printf("\n");

    start = clock();
    insertionSort(arr, n);
    end = clock();

    double cycles = (double)(end-start);
    cpu_execution_time = (double) (cycles / 1000000);
    double clock = 1e6;

    printf("\nSorted Array: ");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);

    printf("\nNumber of cycles : %lf",cycles);
    printf("\nCPU Clock Speed : %lf ",clock);
    printf("\nCPU execution time for Insertion Sort : %lf us \n",cpu_execution_time * 1e6);
    return 0;
    
  
}

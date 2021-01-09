#include<stdio.h>

// Function to sort input array in ascending order
void BubbleSort(int arr[], int n){
	int i,j;

	for(i=0; i<n-1; i++){
		for(j=0; j<n-i-1; j++){
			if(arr[j] > arr[j+1]){
				int temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
}

int BinarySearch(int arr[], int n, int query){

	int low = 0;
	int high = n-1;
	int mid = (low + high)/2;

	while(low <= high){
		if(arr[mid] < query)
			low = mid + 1;
		else if(arr[mid] == query)
			return mid;
		else if(arr[mid] > query){
			high = mid - 1;
		}
		mid = (low + high)/2;
	}

	return -1;
}
int main(){
	int arr[200];
	int n;
	printf("Enter the size of the array : ");
	scanf("%d",&n);

	printf("Enter the elements in the array : \n");
	for(int i = 0; i<n; i++)
		scanf("%d",&arr[i]);
	
	printf("Input Array : ");
	for(int i = 0; i< n ; i++)
	printf("%d ", arr[i]);

	BubbleSort(arr,n);

	printf("\nSorted Array : ");
	for(int i = 0; i< n ; i++)
	printf("%d ", arr[i]);
	
	int query;
	printf("\nEnter the number to be searched : ");
	scanf("%d", &query);

	int index = BinarySearch(arr,n,query);

	if(index == -1){
		printf("Element Not Found!\n");
	}
	else{
		printf("The element was found at location : %d\n", index + 1);
	}
}
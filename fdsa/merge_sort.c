#include<stdio.h>

// auxiliary function to merge the two sub arrays after sorting them 
void merge(int arr[], int l, int m, int h){
	int left_size = m-l+1;
	int right_size = h-m;

	int left[left_size], right[right_size];

	// splitting the array into sub-arrays
	for(int i = 0; i < left_size; i++)
		left[i] = arr[l+i];
	for(int i = 0; i < right_size; i++)
		right[i] = arr[m+i+1];

	int i = 0, j = 0;
	int k = l;

	// using the  sub-arrays to merge sort into the original array
	while(i < left_size && j < right_size){
		if(left[i] <= right[j]){
			arr[k] = left[i];
			i++;
		}
		else{
			arr[k] = right[j];
			j++;
		}
		k++;
	}

	// appending the remaining elements into the original array
	while(i < left_size){
		arr[k] = left[i];
		i++;
		k++;
	}

	while(j < right_size){
		arr[k] = right[j];
		j++;
		k++;
	}
}

// function to implement merge sort which uses the merge function
void MergeSort(int arr[], int l, int h){
	int mid = (l+h-1)/2;
	if(l >= h){
		return;
	}
	MergeSort(arr, l, mid);
    MergeSort(arr, mid+1, h);
    merge(arr, l, mid, h);
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

	MergeSort(arr, 0, n-1);

	printf("\nSorted Array : ");
	for(int i = 0; i< n ; i++)
	printf("%d ", arr[i]);
	
	return 0;
}
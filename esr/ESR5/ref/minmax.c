
#include <stdio.h>
#include <conio.h>
 
 
int main()
{
    int a[] = {1,2,3,4,5,6,7,8,9,10};
    int n = 10;
    int min,max;

    min=max=a[0];
    for(int i=1; i<n; i++)
    {
         if(min>a[i])
		  min=a[i];   
		   if(max<a[i])
		    max=a[i];       
    }
 
    return 0;
}
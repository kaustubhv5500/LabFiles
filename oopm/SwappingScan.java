//Swapping using Scanner Class using 3 variables


import java.util.Scanner;

class SwappingScan
{
	public static void main(String args[])
	{
		int a,b,temp;
		Scanner s=new Scanner(System.in);
		System.out.println("Enter the first value");
		a=s.nextInt();
		System.out.println("Enter the second value");
		b=s.nextInt();
		System.out.println("Elements before Swapping--");
		System.out.println("First Element is: "+a);
		System.out.println("Second Element is: "+b);
		temp=a;
		a=b;
		b=temp;
		System.out.println("Elements after swapping--"); 
		System.out.println("First Element is: "+a);
		System.out.println("Second Element is: "+b);
	}
}	
	
	
/*
java SwappingScan
Enter the first value
2143
Enter the second value
6598
Elements before Swapping--
First Element is: 2143
Second Element is: 6598
Elements after swapping--
First Element is: 6598
Second Element is: 2143

*/

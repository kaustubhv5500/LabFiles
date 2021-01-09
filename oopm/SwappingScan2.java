//Swapping using Scanner class using 2 variables

import java.util.Scanner;

class SwappingScan2
{
	public static void main(String args[])
	{
		int a,b;
		Scanner s=new Scanner(System.in);
		System.out.println("Enter the first value");
		a=s.nextInt();
		System.out.println("Enter the second value");
		b=s.nextInt();
		System.out.println("Elements before Swapping--");
		System.out.println("First Element is: "+a);
		System.out.println("Second Element is: "+b);
		a=a+b;
		b=a-b;
		a=a-b;
		System.out.println("Elements after swapping--"); 
		System.out.println("First Element is: "+a);
		System.out.println("Second Element is: "+b);
	}
}	
	
	
/*
java SwappingScan2
Enter the first value
23
Enter the second value
334
Elements before Swapping--
First Element is: 23
Second Element is: 334
Elements after swapping--
First Element is: 334
Second Element is: 23

*/

//Swapping using BufferReader using 2 variables

import java.io.*;

class SwappingBuff2
{
	public static void main(String args[]) throws IOException
	{
		int a,b;
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("Enter the first value");
		a=Integer.parseInt(br.readLine());
		System.out.println("Enter the second value");
		b=Integer.parseInt(br.readLine());
		
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
java SwappingBuff2
Enter the first value
123
Enter the second value
3465
Elements before Swapping--
First Element is: 123
Second Element is: 3465
Elements after swapping--
First Element is: 3465
Second Element is: 123

*/

//Swapping using command line arguments and 3 variables

class Swapping
{
	public static void main(String args[])
	{
		int a,b,temp;
		a=Integer.parseInt(args[0]);
		b=Integer.parseInt(args[1]);
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
java Swapping 32243 323
Elements before Swapping--
First Element is: 32243
Second Element is: 323
Elements after swapping--
First Element is: 323
Second Element is: 32243
*/

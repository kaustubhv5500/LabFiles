//Swapping using command line arguments and 2 variables

class Swapping2
{
	public static void main(String args[])
	{
		int a,b;
		a=Integer.parseInt(args[0]);
		b=Integer.parseInt(args[1]);
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
java Swapping2 9540 434
Elements before Swapping--
First Element is: 9540
Second Element is: 434
Elements after swapping--
First Element is: 434
Second Element is: 9540

*/	

//Program to find the area of a rectangle and a circle using method overloading

class OverloadDemo
{
	void area(float x,float y)
	{	
		float ar=x*y;
		System.out.println("The area of the rectangle is:"+ar+" sq units");
	}
	
	void area(double x)
	{
		double ar=3.14159*x*x;
		System.out.println("The area of the circle is:"+ar+" sq units");
	}
	
}

class Overload
{
	public static void main(String args[])
	{
		OverloadDemo ob= new OverloadDemo();
		ob.area(10,20);
		ob.area(2.5);
	}
}


/*
RESULT
java Overload
The area of the rectangle is:200.0 sq units
The area of the circle is:19.6349375 sq units
*/

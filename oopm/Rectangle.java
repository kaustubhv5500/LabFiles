//Program to calculate area of rectangle using constructors

class Rectangle
{
	int a,b,l;
	
	Rectangle()
	{
		l=10;
		b=20;
	}
	
	void area()
	{
		a=l*b;
		System.out.println(""+a);
	}
	
	public static void main(String args[])
	{
		Rectangle r=new Rectangle();
		System.out.println("Area of rectangle using default constructor is: ");
		r.area();
	}
	
}

/*RESULT
java Rectangle
Area of rectangle using default constructor is: 
200

*/
		

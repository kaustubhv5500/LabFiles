//Program to calculate area of rectangle using parameterized constructor

class Rectangle1
{
	int a,b,l;
	
	Rectangle1(int x,int y)
	{
		l=x;
		b=y;
	}
	
	void area()
	{
		a=l*b;
		System.out.println(""+a);
	}
	
	public static void main(String args[])
	{
		Rectangle1 r=new Rectangle1(10,20);
		System.out.println("Area of rectangle using paramterized constructor is:");
		r.area();
	}
}

/*
RESULT
java Rectangle1
Area of rectangle using paramterized constructor is:
200
*/

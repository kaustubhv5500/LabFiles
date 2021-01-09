
//Program to calculate the area of a rectangle and a circle using method overriding


class OverridingDemo
{
	public int length=10;
}
	
class Rectangle extends OverridingDemo
{
	void area()
	{
		int breadth=7;
		int area=length*breadth;
		System.out.println("The area of the rectangle is:"+area+" sq units");
	}
}

class Circle extends OverridingDemo
{
	void area()
	{
	double area=3.1415*length*length;
	System.out.println("The area of the circle is: "+area+" sq units");
	}
}

class Inheritance
{
	public static void main(String args[])
	{
	Rectangle rec= new Rectangle();
	Circle cir= new Circle();
	rec.area();
	cir.area();
	}
}


/*
RESULT:
javac Inheritance.java
java Inheritance
The area of the rectangle is:70 sq units
The area of the circle is: 314.15000000000003 sq units
*/

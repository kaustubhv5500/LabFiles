//Name : Kaustubh Venkatesh
//UID : 2018120033
//Program to calculate the area of a circle and a triangle by defining interface shape and overriding method area

import java.util.*;

interface Shape
{
        double area (int r,int b,int h);
}

class Circle implements Shape
{
        public double area (int r,int b, int h)
        {
                return (r*r*Math.PI);           //area of circle
        }
        
}

class Triangle implements Shape
{
        public double area (int r, int b, int h)
        {
                return (0.5*b*h);              //area of triangle
        }
}


class InterfaceClass
{
        public static void main(String args[])
        {
                Scanner sc = new Scanner(System.in);
                System.out.println("Enter the radius of the circle");
                int rad = sc.nextInt();
                System.out.println("Enter the base and the height of the triangle");
                int height = sc.nextInt();
                int base = sc.nextInt();
                
                Circle c = new Circle();
                Triangle t = new Triangle();
                
                double area1 = c.area(rad,base,height);
                double area2 = t.area(rad,base,height);
                
                System.out.format("The area of the circle is:%.4f\n",area1);
                System.out.format("The area of the triangle is: %.4f\n",area2);
        }
}         

/*
RESULT
spit@HP-New-PC-69:~/Desktop$ javac InterfaceClass.java
spit@HP-New-PC-69:~/Desktop$ java InterfaceClass
Enter the radius of the circle
34
Enter the base and the height of the triangle
22
90
The area of the circle is:3631.6811
The area of the triangle is: 990.0000
*/            

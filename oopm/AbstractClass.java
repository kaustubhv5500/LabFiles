//Name : Kaustubh Venkatesh  
//UID : 2018120033
//Program to calculate the volume and surface area of a cylinder and cone using the concept of abstraction

import java.util.*;

abstract class Shape
{
        final float pi= 3.1415f;
        abstract double area (int h, int r);
        abstract double volume (int h, int r);
}



class Cone extends Shape
{
        double area (int h, int r)
        {
                return (pi*r*r*(Math.sqrt((h*h)+(r*r))));
        }
        
        double volume (int h, int r)
        {
                return (pi*r*r*h/3);
        }
}


class Cylinder extends Shape
{
        double area (int h,int r)
        {
                return ((2*pi*r*h)+(2*pi*r*r));
        }
        
        double volume (int h, int r)
        {
                return (pi*r*r*h);
        }
}


class AbstractClass
{
        public static void main(String args[])
        {
                Scanner sc = new Scanner(System.in);
                Cone obj1 = new Cone();
                Cylinder obj2 = new Cylinder();
                
                int r1,r2,h1,h2;
                
                System.out.println("Enter the height of the cone");
                h1=sc.nextInt();
                System.out.println("Enter the radius of the cone");
                r1=sc.nextInt();
                System.out.println("Enter the height of the cylinder");
                h2=sc.nextInt();
                System.out.println("Enter the radius of the cylinder");
                r2=sc.nextInt();
                
                System.out.println("Area of the cone is:"+obj1.area(h1,r1));
                System.out.println("Volume of the cone is:"+obj1.volume(h1,r1));
                System.out.println("Area of the cylinder is:"+obj2.area(h2,r2));
                System.out.println("Volume of the cylinder is:"+obj2.volume(h2,r2));
         }
         
}      
    
    
    
    
/*
RESULT
spit@HP-New-PC-69:~$ cd Desktop
spit@HP-New-PC-69:~/Desktop$ javac AbstractClass.java
spit@HP-New-PC-69:~/Desktop$ java AbstractClass
Enter the height of the cone
34
Enter the radius of the cone
90
Enter the height of the cylinder
34
Enter the radius of the cylinder
77
Area of the cone is:2448125.79111597
Volume of the cone is:288389.6875
Area of the cylinder is:53700.796875
Volume of the cylinder is:633282.375
*/
        
        
        
        
        
        
        

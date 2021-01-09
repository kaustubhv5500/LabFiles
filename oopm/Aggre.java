//Program to display details of a book using Aggregation and Composition


import java.util.*;
import javax.swing.*;


class book
{
	int id;
	String name,author;

	void sgetdata(int si,String sn,String sa)
	{
		id = si;
		name = sn;
		author = sa;
	}

}

class library
{
	int r;
	String x,y,z;

	book[] s = new book[3];

	void stud()
	{	

		Scanner sc = new Scanner(System.in);

		for(int i=0;i<3;i++)
		{
			System.out.println("Enter the name of the book: ");
			x = sc.nextLine();



			System.out.println("Enter the Author of the book: ");
			y = sc.nextLine();

			System.out.println("Enter the ID: ");
			r=sc.nextInt();
			z=sc.nextLine();

			s[i] = new book();
			s[i].sgetdata(r,x,y);	
		}
	}

	void sdata()
	{	
		String output = "";

		for(int i=0;i<3;i++)
		{	
			output+= "Book "+(i+1)+": "+ " " +s[i].name +" "+s[i].id+" "+s[i].author+"\n";
		}
		System.out.println(output);
		//OptionPane.showMessageDialog(null,output);
	}
}

class Aggre
{
	String Iname = "SPIT";
	library co = new library();

	void display()
	{
		System.out.println("Enter the data for EXTC Department");
		co.stud();
		System.out.println("Data of EXTC Department: ");
		co.sdata();
	}

	public static void main(String args[])
	{
		Aggre ins = new Aggre();
		ins.display();
	}
}


/*
RESULT
javac Aggre.java
spit@HP-New-PC-59:~/Desktop$ java Aggre
Enter the data for EXTC Department
Enter the name of the book: 
Bible  
Enter the Author of the book: 
Jesus
Enter the ID: 
1
Enter the name of the book: 
E maths
Enter the Author of the book: 
crg
Enter the ID: 
3443
Enter the name of the book: 
Circuit theory
Enter the Author of the book: 
Ravish Singh
Enter the ID: 
234
Data of EXTC Department: 
Book 1:  Bible 1 Jesus
Book 2:  E maths 3443 crg
Book 3:  Circuit theory 234 Ravish Singh
*/

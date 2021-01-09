//Program to display details of books in library using composition

import java.util.*;

class library
{
	class book
	{
		int id;
		String name="",author="";

	void getbook(String n,String a,int idd)
	{
		id=idd;
		name=n;
		author=a;
	}
}
} 

class Comp
{	
		public static void main(String args[]) throws Exception
		{
			int idno;
			String value1="";
			String value2="";
			String z="";
			library lib = new library();
			library.book[] b = new library.book[3];

			Scanner sc = new Scanner(System.in);

			for(int i=0;i<3;i++)
			{
				System.out.println("Enter the name of the book");
				value1= sc. nextLine();

				System.out.println("Enter the name of the author");
				value2 = sc.nextLine();

				System.out.println("Enter the id");
				idno = sc.nextInt();
				z = sc.nextLine();

				b[i] = lib.new book();
				b[i].getbook(value1,value2,idno);
			}

			for(int j=0;j<3;j++)
			{
			System.out.println("Book "+(j+1)+":"+b[j].name+" "+b[j].author+" "+b[j].id);
	
			}
			
		}


}

/*Result:
spit@HP-New-PC-59:~/Desktop$ javac Comp.java
spit@HP-New-PC-59:~/Desktop$ java Comp
Enter the name of the book
Bible 
Enter the name of the author
jesus
Enter the id
23
Enter the name of the book
E maths
Enter the name of the author
HK dass
Enter the id
223
Enter the name of the book
Circuit Theory
Enter the name of the author
Ravish singh
Enter the id
2332
Book 1:Bible jesus 23
Book 2:E maths HK dass 223
Book 3:Circuit Theory Ravish singh 2332
*/
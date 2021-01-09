/*Program to handle exception for invalid month number by using throws 
keyword and use of throw keyword in main() method*/


import java.util.*;

class InvalidMonthException extends Exception
{
	InvalidMonthException()
	{
		System.out.println("Invalid Month Number");
	}
}


class getMonth
{
	getMonth(int monthnum)	throws InvalidMonthException
	{
		if((monthnum>12) || (monthnum<1))
		{
			throw new InvalidMonthException();
		}
		else
		{
			System.out.println("Month Number is Valid");
		}
	}
}

class myException
{
	public static void main(String[] args) throws InvalidMonthException
	{
			try
			{
				Scanner sc = new Scanner(System.in);
				System.out.println("Enter a month number between 1 and 12");
				int n = sc.nextInt();
				getMonth gm = new getMonth(n);
				System.out.println("The month number is: "+n);
			}
			catch(InvalidMonthException e)
			{
				System.out.println("Month does not exist");
			}
	}
}


/*
RESULT
spit@HP-New-PC-59:~/Desktop/Java$ javac myException.java
spit@HP-New-PC-59:~/Desktop/Java$ java myException
Enter a month number between 1 and 12
22
Invalid Month Number
Month does not exist
spit@HP-New-PC-59:~/Desktop/Java$ java myException
Enter a month number between 1 and 12
5
Month Number is Valid
The month number is: 5
*/
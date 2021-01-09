//Program to display 1 to 100 numbers by creating threads Thread class and Runnable Interface

import java.util.*;

class thread1 extends Thread
{
	public void run()   //run is overridden
	{
		for(int i=0;i<=50;i++)
		{
			System.out.print(i+" ");
		}
	}
}

class thread2 implements Runnable
{
	public void run()
	{
		for(int i=51;i<=100;i++)
		{
			System.out.print(i+" ");
		}
	}
}


class threads
{
	public static void main(String[] args) throws InterruptedException
	{
		
		
			thread1 t1 = new thread1();
			Thread t2 = new Thread(new thread2());
			t1.start();
			t1.join();
			t2.start();
			
	}
}


/*
RESULT
spit@HP-New-PC-59:~/Desktop/Java$ javac threads.java
spit@HP-New-PC-59:~/Desktop/Java$ java threads
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 
26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 
76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 
 */

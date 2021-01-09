  import java.sql.*;
  import java.io.*;
  import java.sql.Connection;
  import java.sql.DriverManager;
  import java.sql.SQLException;
  
  class insertintotable{
          
	  insertintotable()
	  {
		  //Default constructor
	  }
	  
	  public static void main(String args[]) throws Exception{
		  
		  try {
		 File file = new File("C:\\Users\\Kaustubh\\eclipse-workspace\\OOPM\\src\\out.csv");
		 BufferedReader br = new BufferedReader(new FileReader(file));
		 String st;
		 
		 File file1 = new File("C:\\Users\\Kaustubh\\eclipse-workspace\\OOPM\\src\\modify.csv");
		BufferedReader br1 = new BufferedReader(new FileReader(file1));
		 String st1;
		 
		 
		 while (( st1 = br1.readLine()) != null) 
		 {
			// JDBC driver name and database URL
		   	  final String db_url = "jdbc:mysql://localhost";

		   	 //  Database credentials
		   	 final String user= "root";
		   	 final String pass = "root";
		     Connection conn = null;
		   	 Statement stmt = null;
		   	 
			 String[] inp1 = st1.split(",");
			 try{
		   	      //STEP 2: Register JDBC driver
		   	      Class.forName("com.mysql.jdbc.Driver");
		   	      //stmt.executeUpdate("use PRISON");

		   	      //STEP 3: Open a connection
		   	      System.out.println("Connecting to a selected database...");
		   	      conn = DriverManager.getConnection(db_url, user, pass);
		   	      System.out.println("Connected database successfully...");
		   	      //STEP 4: Execute a query
		   	      System.out.println("Inserting records into the table...");
		   	      stmt = conn.createStatement();
		   	      
		   	      stmt.executeUpdate("Use PRISON");
		   	      
		   	     
		   	      inp1[1] = "\'" + inp1[2] + "\'";
		   	      inp1[2] = "\'" + inp1[3] + "\'";
		   	      inp1[4] = "\'" + inp1[4] + "\'";
		   	      
		   	      String sql1 = "INSERT INTO Modify " +
		   	                   "VALUES("+inp1[0]+","+inp1[1]+","+inp1[2]+","+inp1[3]+","+inp1[4]+")";
		   	      System.out.println(sql1);
		   	      stmt.executeUpdate(sql1);

		   	      System.out.println("Inserted records into the table...");

		   	   }catch(SQLException se){
		   	      //Handle errors for JDBC
		   	      se.printStackTrace();
		   	   }catch(Exception e){
		   	      //Handle errors for Class.forName
		   	      e.printStackTrace();
		   	   }finally{
		   	      //finally block used to close resources
		   	      try{
		   	         if(stmt!=null)
		   	            conn.close();
		   	      }catch(SQLException se){
		   	      }// do nothing
		   	      try{
		   	         if(conn!=null)
		   	            conn.close();
		   	      }catch(SQLException se){
		   	         se.printStackTrace();
		   	      }//end finally try
		   	   }//end try
			 	 
		 }
		 
		 
		
		 
		 
		 
		 while (( st = br.readLine()) != null) 
		 {
			// JDBC driver name and database URL
		   	  final String db_url = "jdbc:mysql://localhost";

		   	 //  Database credentials
		   	 final String user= "root";
		   	 final String pass = "root";
		     Connection conn = null;
		   	 Statement stmt = null;
		   	 
			 String[] inp = st.split(",");
			 try{
		   	      //STEP 2: Register JDBC driver
		   	      Class.forName("com.mysql.jdbc.Driver");
		   	      //stmt.executeUpdate("use PRISON");

		   	      //STEP 3: Open a connection
		   	      System.out.println("Connecting to a selected database...");
		   	      conn = DriverManager.getConnection(db_url, user, pass);
		   	      System.out.println("Connected database successfully...");
		   	      //STEP 4: Execute a query
		   	      System.out.println("Inserting records into the table...");
		   	      stmt = conn.createStatement();
		   	      
		   	      stmt.executeUpdate("Use PRISON");
		   	      
		   	      inp[2] = "\'" + inp[2] + "\'";
		   	      inp[5] = "\'" + inp[5] + "\'";
		   	      inp[1] = "\'" + inp[1] + "\'";
		   	      inp[3] = "\'" + inp[3].charAt(0) + "\'";
		   	      inp[6] = "\'" + inp[6] + "\'";
		   	      inp[7] = "\'" + inp[7] + "\'";
		   	      inp[4] =  "\'" + inp[4] + "\'";
		   	      
		   	      
		   	      String sql = "INSERT INTO PRISONER " +
		   	                   "VALUES("+inp[0]+","+inp[1]+","+inp[2]+","+inp[3]+","+inp[4]+"," +inp[5]+","+inp[6]+","+inp[7]+");";
		 
		   	      stmt.executeUpdate(sql);

		   	      System.out.println("Inserted records into the table...");

		   	   }catch(SQLException se){
		   	      //Handle errors for JDBC
		   	      se.printStackTrace();
		   	   }catch(Exception e){
		   	      //Handle errors for Class.forName
		   	      e.printStackTrace();
		   	   }finally{
		   	      //finally block used to close resources
		   	      try{
		   	         if(stmt!=null)
		   	            conn.close();
		   	      }catch(SQLException se){
		   	      }// do nothing
		   	      try{
		   	         if(conn!=null)
		   	            conn.close();
		   	      }catch(SQLException se){
		   	         se.printStackTrace();
		   	      }//end finally try
		   	   }//end try
			 	 
		 }
   	   
        }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
  }
	  }
 
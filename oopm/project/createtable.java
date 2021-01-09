
import java.sql.*;
public class createtable {
	//STEP 1. Import required packages
	

	
	   // JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost/PRISON";

	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "root";
	   
	   public static void main(String args[]) { 
	   Connection conn = null;
	   Statement stmt = null;
	   try{
	      //STEP 2: Register JDBC driver
	      Class.forName("com.mysql.jdbc.Driver");

	      //STEP 3: Open a connection
	      System.out.println("Connecting to a selected database...");
	      conn = DriverManager.getConnection(DB_URL, USER, PASS);
	      System.out.println("Connected database successfully...");
	      
	      //STEP 4: Execute a query
	      System.out.println("Creating table in given database...");
	      stmt = conn.createStatement();
	      
	      stmt.executeUpdate("drop database PRISON");
	      stmt.executeUpdate("Create database PRISON");
	      stmt.executeUpdate("use PRISON");
	     

	      String sql1 = "CREATE TABLE Prisoner " +
	                   "(id INT," +"name varchar(100)," +" dob DATE, " +
	                   " gender CHAR(1), " + 
	                   " doa DATE, " + 
	                   " felony varchar(250), " + 
	                   " description varchar(200), " + 
	                   	" cell_no varchar(200), " + " PRIMARY KEY (id))"; 
	      
	      String sql2 = "Create Table Modify(id INT,felony char(200),reduction char(200),years_mod INT,year_release Date)";

	      stmt.executeUpdate(sql1);
	      stmt.executeUpdate(sql2);
	      
	      System.out.println("Created table in given database...");
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
	}//end main
	}//end JDBCExample


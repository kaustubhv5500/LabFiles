import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.util.*;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import java.io.Serializable;
import java.sql.*;
import javax.swing.JButton;


public class Analyse extends Prisoner implements Serializable {
	
	
	
	Analyse() { JOptionPane.showMessageDialog(null, "Please check Console for analysis data");} //default constructor
		
		
		      
		      public static void table()
		  	{	
		  		     
		  		 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		  		    final String DB_URL = "jdbc:mysql://localhost";

		  		   //  Database credentials
		  		   final String USER = "root";
		  		    final String PASS = "root";
		  		   
		  		   
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
		  		      System.out.println("Creating statement...");
		  		      stmt = conn.createStatement();
		  		      
		  		      stmt.executeUpdate("Use PRISON");
		  		      
		  		      String sql = "SELECT count(*) from Prisoner";
		  		      ResultSet rs = stmt.executeQuery(sql);
		  		      ResultSetMetaData rsmd = rs.getMetaData();
		  		      int columnsNumber = rsmd.getColumnCount();
		  		      
		  		      while (rs.next()) {
		  		          for (int i = 1; i <= columnsNumber; i++) {
		  		              if (i > 1) System.out.println(",  ");
		  		              String columnValue = rs.getString(i);
		  		            columnValue = "Number of Prisoners : "+ columnValue;
		  		              System.out.println(columnValue);
		  		          }
		  		          System.out.println("");
		  		      }
		  		   
		  		      rs.close();
		  		      
		  		      
		  		    String sql1 = "select felony,count(felony) from Prisoner group by felony;";
		  		      ResultSet rs1 = stmt.executeQuery(sql1);
		  		      ResultSetMetaData rsmd1 = rs1.getMetaData();
		  		      int columnsNumber1 = rsmd1.getColumnCount();
		  		      System.out.println("Number of Prisoners by Felony:");
		  		      while (rs1.next()) {
		  		          for (int i = 1; i <= columnsNumber1; i++) {
		  		              if (i > 1) System.out.print("");
		  		              String columnValue = rs1.getString(i);
		  		              System.out.println(columnValue);
		  		              
		  		          }
		  		      }
		  		   
		  		      rs1.close();
		  		      
		  		    sql = "select cell_no,id,name from Prisoner group by cell_no;";
		  		     rs = stmt.executeQuery(sql);
		  		      rsmd = rs.getMetaData();
		  		     columnsNumber = rsmd.getColumnCount();
		  		   System.out.println("Prisoners in each cell\n");
		  		      while (rs.next()) {
		  		          for (int i = 1; i <= columnsNumber; i++) {
		  		              if (i > 1) System.out.print("");
		  		              String columnValue = rs.getString(i);
		  		            columnValue = columnValue;
		  		              System.out.println(columnValue);
		  		          }
		  		          System.out.println("");
		  		      }
		  		   
		  		      rs.close();
		  		      
		  		    sql = "select m.year_release,p.id,p.name from Modify m,Prisoner p where m.id=p.id;";
		  		     rs = stmt.executeQuery(sql);
		  		      rsmd = rs.getMetaData();
		  		     columnsNumber = rsmd.getColumnCount();
		  		   System.out.println("Prisoners being released by date\n");
		  		      while (rs.next()) {
		  		          for (int i = 1; i <= columnsNumber; i++) {
		  		              if (i > 1) System.out.print("");
		  		              String columnValue = rs.getString(i);
		  		            columnValue = columnValue;
		  		              System.out.println(columnValue);
		  		          }
		  		          System.out.println("");
		  		      }
		  		   
		  		      rs.close();
		  		      
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
	
	



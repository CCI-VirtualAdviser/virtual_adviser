/* Program: InsertNewCourses
   Author:  David Farthing
   Date:    3 September 2014
   Purpose: This program reads a list of additional courses that have been added to the course catalog
            since 2009 (the last complete online catalog on the web) from the file NewCoursesToInsert.txt
            and inserts them into virtual_adviser database
*/

import java.util.Scanner;
import java.io.*;
import java.util.ArrayList;
import java.sql.*;

public class InsertNewCourses
{
     
   public static void main(String[] args)throws IOException
   {
   
      // JDBC driver name and database URL
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL = "jdbc:mysql://localhost/virtual_adviser";
   
      //  Database credentials
      String USER = "root";
      final String PASS = "root";

      //fields in the text file
      String course_name, course_id, credit_hours;
      
      //field to read in lines of the text file
      String line;
      
      //String to split the file lines by comma delimiter
      String[] fields;
      
      //ArrayList to store string fields for course data
      ArrayList<CourseFields> list = new ArrayList<>();
      
      Scanner scan = new Scanner(new File("BioInformaticsCoursesToBeInserted.txt"));       //original file: NewCoursesToInsert.txt
      while(scan.hasNext())
      {
         line = scan.nextLine();
         fields = line.split(",");
         course_id = fields[0];
         course_name = fields[1];
         credit_hours = fields[2]; 
         
         
         //add course objects to ArrayList
         list.add(new CourseFields(course_id,course_name,credit_hours));
      }

      
      //test that course objects were added correctly to the arrayList
      for(CourseFields cf : list)
      {
         System.out.println(cf.getId() + " " + cf.getName() + " " + cf.getHours());
      }
      System.out.println();
      
      
      //access virtual_adviser database and insert course fields into course_list table
            
      Connection conn = null;
      Statement stmt = null;
      try{
         //STEP 2: Register JDBC driver
         Class.forName(JDBC_DRIVER);
   
         //STEP 3: Open a connection
         System.out.println("Connecting to a selected database...");
         conn = DriverManager.getConnection(DB_URL, USER, PASS);
         System.out.println("Connected database successfully...");
         
         //STEP 4: Execute a query
         System.out.println("Inserting records into the table...");
         stmt = conn.createStatement();
         
         //allow sql to truncate values that are too long for a field
         stmt.executeUpdate("SET SQL_MODE = ''");
         
         for(CourseFields cf:list)
         {
            System.out.println(cf.getId() + " " + cf.getName() + " " + cf.getHours());
            String sql = "INSERT INTO course_list " +
                         "VALUES (" + "'" + cf.getId() + "'" + "," + "'" + cf.getName() + "'" + "," + "'" + cf.getHours() + "'" + ")";
            stmt.executeUpdate(sql);
         }
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
   System.out.println("Goodbye!"); 
   }//end main

}
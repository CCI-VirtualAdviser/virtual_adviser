/* Program: CoursesTakenToInsert
   Author:  David Farthing
   Date:    7 September 2014
   Purpose: To insert courses taken by a student read from a text file into the virtual_adviser database courses_taken table
*/

import java.util.Scanner;
import java.io.*;
import java.util.ArrayList;
import java.sql.*;

public class CoursesTakenToInsert
{
   public static void main(String[] args) throws IOException
   {
      // JDBC driver name and database URL
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL = "jdbc:mysql://localhost/virtual_adviser";
   
      //  Database credentials
      String USER = "root";
      final String PASS = "root";
      
      //fields in the text file
      String student_id, course_id, semester_id,letter_grade;
      
      //field to read in lines of the text file
      String line;
      
      //String to split the file lines by comma delimiter
      String[] fields;
      
      //ArrayList to store string fields for course data
      ArrayList<CourseTaken> list = new ArrayList<>();
      
      Scanner scan = new Scanner(new File("CoursesTakenInsertion.txt"));       
      while(scan.hasNext())
      {
         line = scan.nextLine();
         fields = line.split(",");
         
         //code for identifying which line in the text file has a typo and causes code to crash (missing comma will reduce number
         //of fields to 3 instead of 4 for example in String[] fields which is created by the split function.
         if(fields.length < 4)
         {
            System.out.println("line = " + line);
            for(String s: fields)
            {
               System.out.println("s = " + s);
            }
         }
         
         student_id = fields[0];
         course_id = fields[1];
         semester_id = fields[2];
         letter_grade = fields[3]; 
         
         
         //add course objects to ArrayList
         list.add(new CourseTaken(student_id,course_id,semester_id,letter_grade));
      }

      
      //test that course objects were added correctly to the arrayList
      /*
      for(CourseTaken cf : list)
      {
         System.out.println(cf.getStudentID() + " " + cf.getCourseID() + " " + cf.getSemesterID() + " " + cf.getLetterGrade());
      }
      System.out.println();
      */
      
      
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
         
         //NULL value inserted at end is for exemption_for attribute and that is always NULL unless course credit given for
         //a a transfer class that exempts a certain general education requirement
         for(CourseTaken cf:list)
         {
            //System.out.println(cf.getStudentID() + " " + cf.getCourseID() + " " + cf.getSemesterID() + " " + cf.getLetterGrade());
            String sql = "INSERT INTO courses_taken " +
                         "VALUES (" + "'" + cf.getStudentID() + "','" + cf.getCourseID() + "','" + cf.getSemesterID() + "','" 
                         + cf.getLetterGrade() + "'" + ",NULL" + ")";
            System.out.println(sql);
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
   }
}
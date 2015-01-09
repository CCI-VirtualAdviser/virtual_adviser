import java.sql.*;
import java.io.*;
import java.util.ArrayList;

public class InsertCourses {
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/virtual_adviser2";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "root";
   
   public static void main(String[] args) {
   Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName(JDBC_DRIVER);

      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //create arrayList of objects to insert
      ArrayList<Course> courseList = new ArrayList<Course>();
      
      //create object input stream to read course objects from file into arrayList
      ObjectInputStream in = new ObjectInputStream(new FileInputStream("courseObjects.txt"));
      courseList = (ArrayList<Course>)in.readObject();
      
      //STEP 4: Execute a query
      System.out.println("Inserting records into the table...");
      stmt = conn.createStatement();
      
      //allow sql to truncate values that are too long for a field
      stmt.executeUpdate("SET SQL_MODE = ''");
      
      for(Course c:courseList)
      {
         System.out.println(c.toString());
         String sql = "INSERT INTO course_list " +
                      "VALUES ('"  + c.courseId + "'" + "," + "'" + c.courseName + "'" + "," + "'" + c.creditHours  +  "'" + "," + "'" + c.deptId + "'" +") ";
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
}//end JDBCExample
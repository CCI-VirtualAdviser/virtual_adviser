import java.io.Serializable;

public class Course implements Serializable
{
   public String deptId,courseId, courseName, creditHours,crossList1, crossList2, preReq, coReq, preOrCoreq;
      
      
   //this first constructor is for the purpose of populating the virtual_adviser database with data for its course_list table,
   //which only needs the dept_id, course_id, course_name, and credit_hours fields
   public Course(String dept, String id, String name, String hours)
   {
      deptId = dept;
      courseId = id;
      courseName = name;
      creditHours = hours;      
   }

   //this overloaded constructor is for future use, when code has been developed in Extract.java to handle multiple cross listings and
   //pre and coreqs that are currently rules like "permission of the instructor"
   public Course(String dept, String id, String name, String hours, String cross1, String cross2, String prereq, String coreq, String preorcoreq)
   {
      deptId = dept;
      courseId = id;
      courseName = name;
      creditHours = hours;
      crossList1 = cross1;
      crossList2 = cross2;
      preReq = prereq;
      coReq = coreq;
      preOrCoreq = preorcoreq;
      
   }
   
   public String toString()
   {
      String info = deptId + " " + courseId + " " + courseName + " (" + creditHours + ")"; // \n\tCrosslisted: " + crossList1 + " " + crossList2 + " Prereq: " + preReq + " Coreq: " + coReq + " Pre- or coreq: " + preOrCoreq;
      return info;
   }
}
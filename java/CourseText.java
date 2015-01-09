/* This code is used to create CourseText objects by the main java program "ExtractText.java". These objects will be created and stored
   in a text file called "courseInfo2009.txt". From there, the main java program "Extract.java" can read the data and create Course objects
   which can be inserted in the virtual_adviser database using the java program "InsertCourses.java"
*/

public class CourseText
{
   public String courseId, courseName, creditHours, crossList;
   public String prereq, coreq, preOrCoreq;
   
   public CourseText(String id, String name, String hours, String cross, String prereq, String coreq, String preOrCoreq)
   {
      courseId = id;
      courseName = name;
      creditHours = hours;
      crossList = cross;
      this.prereq = prereq;
      this.coreq = coreq;
      this.preOrCoreq = preOrCoreq;
   }
   
   public String toString()
   {
      return courseId + " " + courseName + " (" + creditHours + ") " + " crosslisted: " + crossList + " Preqreq: " + prereq + " Coreq: " + coreq + " Pre- or Coreq: " + preOrCoreq;
   }
   
   public String getPrereq()
   {
      return prereq;
   }
   
   public String getPreOrCoreq()
   {
      return preOrCoreq;
   }
   
   public String getCoreq()
   {
      return preOrCoreq;
   }

}
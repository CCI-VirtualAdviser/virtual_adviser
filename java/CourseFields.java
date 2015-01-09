 //a class to store objects containing course info in an ArrayList
 //To be used with main class InsertNewCourses,java
 
   public class CourseFields
   {
      String course_name, course_id, credit_hours;
      public CourseFields(String id,String name, String hours)
      {
         this.course_name = name;
         this.course_id = id;
         this.credit_hours = hours;
      }
      
      public String getName()
      {
         return course_name;
      }
      
      public String getId()
      {
         return course_id;
      }
      
      public String getHours()
      {
         return credit_hours;
      }
   }

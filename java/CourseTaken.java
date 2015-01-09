//a class to store objects containing courses_taken info in an ArrayList
//To be used with main class CoursesTakenToInsert.java
 
   public class CourseTaken
   {
      String student_id, course_id, semester_id,letter_grade;
      
      public CourseTaken(String student_id, String course_id, String semester_id,String letter_grade)
      {
         this.student_id = student_id;
         this.course_id = course_id;
         this.semester_id = semester_id;
         this.letter_grade = letter_grade;
      }
      
      public String getStudentID()
      {
         return student_id;
      }
      
      public String getCourseID()
      {
         return course_id;
      }
      
      public String getSemesterID()
      {
         return semester_id;
      }
      
      public String getLetterGrade()
      {
         return letter_grade;
      }

   }

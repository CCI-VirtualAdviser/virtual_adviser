/* This program reads from a text file called "courseInfo2009.txt" and creates Course objects which it writes to 
   an OutputObjectStream called "courseObjects.txt". The latter file can then be read by the "InsertCourses.java" program
   which actually inserts the objects into the virtual_adviser database
*/

import java.util.Scanner;
import java.io.*;
import java.util.ArrayList;

public class Extract
{
   public static void main(String[] args) throws IOException
   {
      Scanner input = new Scanner(new File("courseInfo2009.txt"));          
      String line;   //each line of input from text file stored here
      char[] data;   //a character array of the input line
      int index;     //used as index of character array
      
      int leftParen; //index of left parenthesis
      int rightParen;//index of right parenthesis

      
      String dept_id, course_number, course_name, credit_hours, cross_list1, cross_list2, prereq, coreq, preOrCoreq;
      boolean has_prereq = false;
      boolean has_coreq = false;
      boolean has_preOrCoreq = false;
      coreq = "";
      prereq = "";
      preOrCoreq = "";
      credit_hours = "";
      
      ArrayList<Course> courseList = new ArrayList<>();
      
      //create object output stream to write course objects to
      ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("courseObjects.txt"));               
      
      while(input.hasNext())
      {
         line = input.nextLine();
         data = line.toCharArray();
         
         //department id is the first four characters of the line
         dept_id = line.substring(0,4);
         
         //set index to point to 5, which is the first character of the course_number in the character array "data" created from each
         //line of input
         index = 5;
         course_number = "";
         
         //while the character at index is not a space, convert it to String and concatenate it to the course_number
         while(data[index] != ' ')
         {
            course_number += String.valueOf(data[index]);
            index++;
         }
         
         //increment index so it is pointing to the first character of the course_name
         index++;
         course_name = "";
         
         //while the character at index is not a left paren (which indicates the start of the credit hours),
         //convert it to String and concatenate it to the course_name
         while(data[index] != '(')
         {
            course_name += String.valueOf(data[index]);
            index++;
         }
         
         //now there is a space at the end of the course_name, so trim it
         course_name = course_name.trim();
         
         //look for the number of credit hours between parentheses
         leftParen = line.indexOf("(");
         rightParen = line.indexOf(")");
         
         //create a substring of the characters between the parentheses
         credit_hours = line.substring(leftParen+1,rightParen);
         
         /* Some of the courses, like "topics in..." courses, independent studies, and internships have a range of credit hours
            in order to accomodate this, a course object will be created for each credit hour in the range
            For example, POLS 3400 Internship in Political Science (3-6) will have the following course objects created:
            POLS 3400 Internship in Political Science (3)
            POLS 3400 Internship in Political Science (4)
            POLS 3400 Internship in Political Science (5)
            POLS 3400 Internship in Political Science (6) 
         */
         
         //in order to determine which courses have credit hour ranges, search for '-' in the credit_hour substring
         //just in case there are spaces in the credit_hours substring, remove them
         credit_hours = credit_hours.replaceAll("\\s","");
         
         if(credit_hours.contains("-"))
         {
            //get the index of the dash
            int dash = credit_hours.indexOf("-");
            String leastCredit = credit_hours.substring(0,dash);
            String mostCredit = credit_hours.substring(dash+1,credit_hours.length());
            
            //create course objects using the same values for dept_id,course_id and course_name with each possible value for credit hours
            for(int i = Integer.parseInt(leastCredit); i <= Integer.parseInt(mostCredit); i++)
            {
               Course c = new Course(dept_id,course_number, course_name,new Integer(i).toString());
               courseList.add(c);
               System.out.println(dept_id + " " + course_number + " " + course_name + " (" + new Integer(i).toString() + ")");
            } 
         }
         //if the substring credit_hours does not include a dash, then it is a single integer and good to be used to create a course object
         else
         {
            Course c = new Course(dept_id,course_number, course_name,credit_hours);
            courseList.add(c);
            System.out.println(dept_id + " " + course_number + " " + course_name + " (" + credit_hours + ")");
         }
         
                  
      }//end while hasnext
      
      //write the courseList object to the ObjectOutputStream
      oos.writeObject(courseList);
      oos.close();
   }
}
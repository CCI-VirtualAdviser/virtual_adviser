/* The purpose of this program is to extract course information from the file "2009CourseCatalog2.txt"
   and write a text file called "courseInfo2009.txt" which contains only the information needed in the Virtual_Adviser database.
   At this point, the course_number string will eventually be split into two fields in the database, dept_id (which will contain the four letters
   representing the department the course is in, like "ITIS" and course_id (which will contain the string of numbers and letters representing
   the course within the department, such as "3130L". It is not necessary here to split this string into objects since this program only writes
   the pertinent info to a text file. The program "Extract.java" will create the actual course objects which will be stored in a serializable
   OutputObjectStream and there the two separate fields for dept_id and course_id will be created for insertion into the database.
*/

import java.util.Scanner;
import java.io.*;
import java.util.ArrayList;

public class ExtractText
{
   public static void main(String[] args) throws IOException
   {
      Scanner input = new Scanner(new File("2009CourseCatalog2.txt"));
      String line;
      char[] data;

      
      String course_number, course_name, credit_hours, cross_list1, cross_list2,prereq, coreq, preOrCoreq;
      boolean has_prereq = false;
      boolean has_coreq = false;
      boolean has_preOrCoreq = false;
      coreq = "";
      prereq = "";
      preOrCoreq = "";
      credit_hours = "";
      
      ArrayList<CourseText> courseList = new ArrayList<>();

      //create file to output course info to
      File output = new File("courseInfo2009.txt");
      PrintWriter pw = new PrintWriter(output);
      
      while(input.hasNext())
      {
         line = input.nextLine();
         data = line.toCharArray();
         //System.out.println("length = " + new String(data));
         //System.out.println(line);
         //extract course number from line         
         boolean period_found = false;
         int index = 0;
         course_number = "";
         
         while(!period_found)
         {
            //System.out.println(index + " " + data[index]);
            if(data[index] == '.') period_found = true;
            else 
            {
               course_number += String.valueOf(data[index]);
               index++;
            }
         }
         
         //extract course name from line         
         boolean second_period_found = false;
         course_name = "";
         
         index += 2;
         
         while(!second_period_found)
         {
            if(data[index] == '.') second_period_found = true;
            else
            {
               course_name += String.valueOf(data[index]);
               index++;
            }
         }
         course_name.trim();
         
         //extract prerequisites and corequisites
         prereq = "";
         coreq = "";
         preOrCoreq = "";
         if(line.contains("Prerequisite"))
         {
            StringBuffer stb = new StringBuffer(line);
            int i = stb.lastIndexOf("Prerequisite");
            //move i to the char beyond the colon
            if(line.charAt(i+12) == 's') i = i + 14;
            else i = i + 13;
            //collect all the chars up to the next period
            period_found = false;
            while(!period_found)
            {
               if(line.charAt(i) == '.') period_found = true;
               else
               {
                  prereq += line.charAt(i);
                  i++;
               }
            }
            prereq = prereq.trim();
         }
         else if(line.contains("Corequisite"))
         {
            StringBuffer stb = new StringBuffer(line);
            int i = stb.lastIndexOf("Corequisite");
            //move i to the char beyond the colon
            if(line.charAt(i+12) == 's') i = i + 14;
            else i = i + 13;
            //collect all the chars up to the next period
            period_found = false;
            while(!period_found)
            {
               if(line.charAt(i) == '.') period_found = true;
               else
               {
                  coreq += line.charAt(i);
                  i++;
               }
            }
            coreq = coreq.trim();
         }
         else if(line.contains("Pre- or corequisite"))
         {
            StringBuffer stb = new StringBuffer(line);
            int i = stb.lastIndexOf("Pre- or corequisite");
            //move i to the char beyond the colon
            if(line.charAt(i+12) == 's') i = i + 21;
            else i = i + 20;
            //collect all the chars up to the next period
            period_found = false;
            while(!period_found)
            {
               if(line.charAt(i) == '.') period_found = true;
               else
               {
                  preOrCoreq += line.charAt(i);
                  i++;
               }
            }
            preOrCoreq = preOrCoreq.trim();
         }
         
         //extract credit hours
         credit_hours = "";
         int first_paren = line.indexOf("(");
         int second_paren = line.indexOf(")");
         
         if(Character.isDigit(line.charAt(first_paren+1))) credit_hours = line.substring(first_paren+1,second_paren);
         else
         {
            boolean isParen = false;
            index = second_paren + 1;
            //move the index pointer to the first character after the next left paren
            while(!isParen)
            {
               if (line.charAt(index) == '(') isParen = true;
               else
               {
                  index++; 
               }
            }
            index++;
            //now create string of characters up to the next right paren
            isParen = false;
            while(!isParen)
            {
               if (line.charAt(index) == ')') isParen = true;
               else
               {
                  credit_hours += String.valueOf(line.charAt(index));
                  index++;
               }
            }
         }
         
         //extract cross-listed (sometimes the text in the file reads "cross-listed as" and sometimes "crosslisted as".
         cross_list = "";
         if(line.contains("Cross-listed") || line.contains("Crosslisted"))
         {

            int i = line.lastIndexOf("Cross"); 
            i += 15; 
            period_found = false;
            while(!period_found)
            {
               cross_list += String.valueOf(line.charAt(i)); 
               i++;
               if(line.charAt(i) == '.') period_found = true;
            }
         }
                          
            
         
         //create courseText object
         //System.out.println(course_number + " " + course_name + " (" + credit_hours + ") cross_list: " + cross_list + " prereq: " + has_prereq + " coreq: " + has_coreq + " preOrCoreq: " + has_preOrCoreq); 
         CourseText ct = new CourseText(course_number, course_name,credit_hours, cross_list, prereq, coreq, preOrCoreq);
         courseList.add(ct);
         pw.println(ct.toString());
         
         
      }//end while hasnext

      pw.close();
   }
}
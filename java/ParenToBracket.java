/* This program reads from a text file called "courseInfo2009.txt" and finds all the courses which have parenthetical
   phrases in the titles of their courses. These need to be changed to brackets, because Extract.java searches for the credit hours
   for the course inside of parentheses. This program only prints out the lines that it finds, so they can be changed by hand in the
   courseInfo2009.txt file.
*/

import java.util.Scanner;
import java.io.*;

public class ParenToBracket
{
   public static void main(String[] args)throws IOException
   {
      Scanner input = new Scanner(new File("courseInfo2009.txt"));          
      String line;
      char[] data;
      String subline;
      int index;
      
      while(input.hasNext())
      {
         line = input.nextLine();
         data = line.toCharArray();
         
         //Each line will have the credit hours in parentheses after the course name, so set index to point the last char in
         //the line of data and go backwards until index is pointing to the first left parenthesis it finds
        index = data.length-1;
        while(data[index] != '(')
        {
         index--;
        }
        
        //now that index is pointing to the first left parenthesis coming from the end of the string forward, 
        //create a substring that will contain only the characters up to that parenthesis (which will get any parenthetical
        //phrases in the course title
        subline = line.substring(0,index);
        
        //if subline contains a right parenthesis, it must have a parenthetical phrase in its course name
        if(subline.contains(")"))
        {
         System.out.println(subline);
        }
      }

   }
}
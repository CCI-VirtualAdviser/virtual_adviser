import java.util.Scanner;
import java.io.*;

public class Text
{
   public static void main(String[] args) throws IOException
   {
      Scanner scan = new Scanner(new File("2009CourseCatalog.txt"));
      File output = new File("2009CourseCatalog2.txt");
      PrintWriter pw = new PrintWriter(output);
      
      String line;
      String startLine;
      String newLine = "";
      boolean newLineComplete = false;
      
      while(scan.hasNext())
      {
         line = scan.nextLine();
         if(line.length() > 8) startLine = line.substring(0,9);
         else startLine = "";
         if(startLine.matches("[A-Z]{4}\\s[\\d]{4}"))
         {
            newLine += line;
            newLineComplete = false;
            while(!newLineComplete && scan.hasNext())
            {
               line = scan.nextLine();
               newLine += " " + line;
               //System.out.println(line.substring(line.length()-2,line.length()) + "  ");
               if(line.substring(line.length()-2,line.length()).matches("[a-z]\\)"))
               {
                  newLineComplete = true;
                  System.out.println(newLine);
                  pw.println(newLine);
                  newLine = "";
               }
            }
            
         }
      }
      
      pw.close();
   }
}
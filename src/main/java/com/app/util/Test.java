package com.app.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

public class Test {

	//user-defined static method that converts a number into words  
	static void numberToWords(char num[])  
	{  
	//determines the number of digits in the given number  
	int len = num.length;  
	//checks the given number has number or not  
	if (len == 0)   
	{  
	//if the given number is empty prints the following statement     
	System.out.println("The string is empty.");  
	return;  
	}  
	//here, we have specified the length of the number to 4  
	//it means that the number (that you want to convert) should be four or less than four digits  
	if (len > 8)   
	{  
	//if the given number is more than four-digit number, it prints the following statement    
	System.out.println("\n The given number has more than 4 digits.");  
	return;  
	}  
	//string type array for one-digit numbers    
	String[] onedigit = new String[] {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};  
	//string type array for two digits numbers    
	//the first index is empty because it makes indexing easy   
	String[] twodigits = new String[] {"", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};  
	//string type array of tens multiples   
	//the first two indexes are empty because it makes indexing easy   
	String[] multipleoftens = new String[] {"",  "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};  
	//string type array of power of tens   
	String[] poweroftens = new String[] {"Hundred", "Thousand", "Lakh"};  
	//Used for debugging purpose only   
	//the valueOf() method returns the string representation of the character array argument  
	System.out.print(String.valueOf(num) + ": ");  
	//checks whether the length of the given string is one or not  
	if (len == 1)   
	{  
	//if the above condition returns true, it accesses the corresponding index and prints the value of that index  
	//[num[0]-'0']: getting the number equal the decimal value of the character (assuming the char is the digit)  
	System.out.println(onedigit[num[0]-'0']);  
	return;  
	}  
	int x = 0;  
	//executes until num does not become not '\0'  
	while (x < num.length)   
	{  
	//executes if the length of the string is greater than equal to three  
	if (len >= 3)   
	{  
	if (num[x] - '0' != 0)   
	{  
	System.out.print(onedigit[num[x] - '0'] + " ");  
	//here length can be 3 or 4  
	System.out.print(poweroftens[len - 4]+ " ");  
	}  
	//decrements the length of the string by 1  
	--len;  
	}  
	//executes if the given number has two digits  
	else   
	{  
	//the if-statement handles the numbers from 10 to 19 only     
	if (num[x] - '0' == 1)   
	{  
	//adding the digits of the given number   
	//the logic behind sum up the digits is that we will use the sum for accessing the index of the array   
	//for example: 17, sum of digits = 8  
	//we will access the 8th index in twodigits[] array i.e. Seventeen  
	int sum = num[x] - '0' + num[x + 1] - '0';  
	System.out.println(twodigits[sum]);  
	return;  
	}  
	//the else-if statement handles the number 20 only  
	//compares the tens and unit place with 2 and 0 respectively  
	else if (num[x] - '0' == 2 && num[x + 1] - '0' == 0)   
	{  
	//executes if the above else-if condition returns true    
	System.out.println("Twenty");  
	return;  
	}  
	//the else block handles the numbers from 21 to 100  
	else   
	{  
	int i = (num[x] - '0');  
	if (i > 0)  
	//prints the ith index element of the array multipleoftens[]  
	System.out.print(multipleoftens[i]+ " ");  
	else  
	//prints space  
	System.out.print("");  
	//increments the variable i by 1  
	++x;  
	//checks whether the number is not equal to zero, it means the number has only a digit  
	if (num[x] - '0' != 0)  
	//prints the ith index element of the array onedigit[]  
	System.out.println(onedigit[num[x] - '0']);  
	}  
	}  
	//increments the variable i by 1  
	++x;  
	}  
	}  
	
	
	//main() method  
	public static void main(String args[])  
	{  
	//calling the user-defined method and that invokes another predefined method toCharArray()  
	//the method toCharArray() converts the given number into character array  
//	numberToWords("111100".toCharArray());  
//	numberToWords("673".toCharArray());  
//	numberToWords("85".toCharArray());  
//	numberToWords("5".toCharArray());  
//	numberToWords("0".toCharArray());  
//	numberToWords("20".toCharArray());  
//	numberToWords("1000".toCharArray());  
//	numberToWords("12345".toCharArray());  
//	//passing empty string   
//	numberToWords("".toCharArray());  
		
		
		
		try {
//			   String path = "C:\\Users\\swamy\\Desktop\\AdminProject-WS\\AdminProject\\src\\main\\resources\\Annexure.jrxml";
//			   Map<String, Object> dataset1 = new HashMap<>();
//			  
//			   // Employee Data
//			   Student student = new Student("N.Veerendranath", "6601", "SCIENTIST-B", "NIC, State Center, Vijayawada", "D.Lalitha");
//			   List<Student> studentList = new ArrayList<>();
//			   studentList.add(student);
//			   JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(studentList);
//			   dataset1.put("employeedataset", dataSource);
//			   
//			   
//			   // Child Data
//			   Child child=new Child(1L, "1st Child", "N.Mithun Gaurav", "29-07-2014", "9 years");
//			   Child child1=new Child(2L, "2nd Child", "N.Jathin Gaurav", "19-03-2020", "3 years");
//			   List<Child> childList = new ArrayList<>();
//			   childList.add(child);
//			   childList.add(child1);
//
//			   // Create a collection data source
//			   JRBeanCollectionDataSource dataSourceChild = new JRBeanCollectionDataSource(childList);
//			   JRBeanCollectionDataSource dataSourceChild1 = new JRBeanCollectionDataSource(childList);
//			   dataset1.put("childDetails", dataSourceChild);
//			   dataset1.put("childDataSet", dataSourceChild1);
//			   // address data
//			   School school=new School("2023,Kendriya Vidyalaya No.1,Vijayawada ,III rd class","");
//			   List<School> schoolList=new ArrayList<>();
//			   schoolList.add(school);
//			   
//			   JRBeanCollectionDataSource dataSourceschool = new JRBeanCollectionDataSource(schoolList);
//			   dataset1.put("schoolDataSet",dataSourceschool);
//			   
//			   
//			   
//			   InputStream input = new FileInputStream(new File(path));
//			   JasperDesign jasperDesign = JRXmlLoader.load(input);
//			   JasperReport report = JasperCompileManager.compileReport(jasperDesign);
//			   JasperPrint print = JasperFillManager.fillReport(report, dataset1, new JREmptyDataSource());
//			   
//			   JasperExportManager.exportReportToPdfFile(print, "C:\\Users\\swamy\\Desktop\\AdminProject-WS\\pdf\\Annexure.pdf");
//			   JasperViewer.viewReport(print);
//			   System.out.println("Report Created.");
			} catch (Exception e) {
			   e.printStackTrace();
			   System.out.println("Exception occurred while creating reports: " + e);
			}

			 
	}  
}

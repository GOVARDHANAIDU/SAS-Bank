package com.SAS.Service;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import java.util.stream.LongStream;

import org.apache.tomcat.jni.Local;

public class CreditCardValidation {
	double startRange ;
	double endRange;
  public String cardApplicable(long accNo,String empStatus, double monthlyIncome) {
	  // employed, Self-Employed and unemployed
	  if(empStatus.equalsIgnoreCase("Employed")) {
		  if(monthlyIncome == 20000.00) {
			  // user can take 40000 to 60000
			 startRange = 40000.00;
			 endRange = 60000.00;
		  } else if(monthlyIncome <= 50000.00 && monthlyIncome >= 20000.00 ) {
			  startRange = 100000.00;
			  endRange = 150000.00;
		  } else if(monthlyIncome <= 100000.00 && monthlyIncome >= 50000.00 ) {
			  startRange = 200000.00;
			  endRange = 300000.00;
		  } else if(monthlyIncome <= 500000.00 && monthlyIncome >= 100000.00 ) {
			    startRange = 1000000.00;
				 endRange = 1500000.00;
		  } else if(monthlyIncome <= 1000000.00 && monthlyIncome >= 500000.00 ) {
			     startRange = 2000000.00;
				 endRange = 3000000.00;
		  } else {
			  startRange = 0.00;
			  endRange = 0.00;
		  }
		  
	  } else if(empStatus.equalsIgnoreCase("Self-Employed")){
		  if(monthlyIncome == 20000.00) {
			  // user can take 40000 to 60000
			 startRange = 40000.00;
			 endRange = 60000.00;
		  } else if(monthlyIncome <= 50000.00 && monthlyIncome >= 20000.00 ) {
			  startRange = 100000.00;
			  endRange = 150000.00;
		  } else if(monthlyIncome <= 100000.00 && monthlyIncome >= 50000.00 ) {
			  startRange = 200000.00;
			  endRange = 300000.00;
		  } else if(monthlyIncome <= 500000.00 && monthlyIncome >= 100000.00 ) {
			    startRange = 1000000.00;
				 endRange = 1500000.00;
		  } else if(monthlyIncome <= 1000000.00 && monthlyIncome >= 500000.00 ) {
			     startRange = 2000000.00;
				 endRange = 3000000.00;
		  } else {
			  startRange = 0.00;
			  endRange = 0.00;
		  }
	  } else {
		  startRange = 1000.00;
		  endRange = 15000.00;
	  }
	  String finalAmount = startRange+ " "+ endRange;
	return finalAmount;
  
  }
  public long generateCreditCardNumber() {
	  int numDigits = 16;
	  Random random = new Random();
      StringBuilder sb = new StringBuilder();

      // Ensure first digit is not zero
      sb.append(random.nextInt(9) + 1);

      // Append the remaining digits
      for (int i = 1; i < numDigits; i++) {
          sb.append(random.nextInt(10));
      }
      String cardNumber = sb.toString();
      long creditcardumber = Long.parseLong(cardNumber);
      return creditcardumber;
  }
  
  public int expMonth() {
	  LocalDate temp_date = LocalDate.now();
	  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

      String dateString = temp_date.format(formatter);
      String tempMonth =  dateString.substring(3, 5);
      System.out.println(tempMonth);
      return Integer.parseInt(tempMonth);
  }
  public int expYear() {
	  LocalDate temp_date = LocalDate.now();
	  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	  
      String dateString = temp_date.format(formatter);
      System.out.println(dateString);
      String tempMonth =  dateString.substring(6, 10);
      System.out.println(tempMonth);
      int year = Integer.parseInt(tempMonth);
      return year+10;
  }
  public int cvv() {
	  int numDigits = 3;
	  Random random = new Random();
      StringBuilder sb = new StringBuilder();

      // Ensure first digit is not zero
      sb.append(random.nextInt(9) + 1);

      // Append the remaining digits
      for (int i = 1; i < numDigits; i++) {
          sb.append(random.nextInt(10));
      }
      String cardNumber = sb.toString();
      int cvv = Integer.parseInt(cardNumber);
      return cvv;
  }
}

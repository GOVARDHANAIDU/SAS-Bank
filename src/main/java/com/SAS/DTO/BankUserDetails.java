package com.SAS.DTO;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class BankUserDetails {
   private  int id;
   private  String userName;
   private  String Emailid;
   private  long phoneNumber;
   private  long aadharNumber;
   private  String panNumber;
   private  long accountNumber;
   private  double accountBalance;
   private  String IFSCCode;
   private  String address;
   private  int pincode;
   private String password;
   private String Upiid;
   private LocalDate dob;
}
package com.SAS.DTO;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class AccountStatement {
  private double transactionAmount;
  private double accountBalance;
  private LocalDate dateOfTransaction;
  private LocalTime timeOfTransaction;
  private String typeOfTransaction;
  private int userId;
  private String userName;
  private String recieverUserName;
  private String modeOfTransaction;

}

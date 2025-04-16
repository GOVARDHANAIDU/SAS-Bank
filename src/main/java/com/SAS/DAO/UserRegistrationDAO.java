package com.SAS.DAO;

import java.util.List;

import com.SAS.DTO.AccountStatement;
import com.SAS.DTO.BankUserDetails;

public interface UserRegistrationDAO {
	boolean insertDetails(BankUserDetails bankUserDetails);
	double getAccountBalance(String recieverUpiid);
	double getSenderAccountBalance(String senderUpiid);
	boolean debitAmountFromAccount(String upi,double amount, String selectAmountMode);
	boolean creditAmount(String upi,double amount, String selectAmountMode);
	int getUserId(String upi);
	String getUserName(String Senderupi);
	boolean setDebitTransactionHistory();
	boolean setCreditTransactionHistory();
	String getReceiverUserName(String upiid);
	String getReceiverUpiUsingPhoneNumber(long number);
	String getReceiverUpiUsingAccountNumber(long Accnumber);
//	String getReceiverUserNameUsingUserUpi(String upiId);
}

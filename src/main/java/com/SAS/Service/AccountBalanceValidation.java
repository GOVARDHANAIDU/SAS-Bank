package com.SAS.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.SAS.DAO.UserRegistrationDAO;
import com.SAS.DAO.UserRegistrationImp;

public class AccountBalanceValidation {
	
	private static List<String> list = new ArrayList<String>();
    UserRegistrationDAO userRegistrationDAO = new UserRegistrationImp();
	public String accountBalance(String senderUpiid , String receiverUpiid  , double amount , String selectedMode) {
	double accountBalance = userRegistrationDAO.getSenderAccountBalance(senderUpiid);
		if(accountBalance <= 0.0)
		{
			return "Invalid";
		}
		else if(accountBalance >= amount)
		{
			String selectAmountMode = selectedMode;
			String receiverUpiid1 = receiverUpiid;
			list.add(receiverUpiid1);
			if(userRegistrationDAO.debitAmountFromAccount(senderUpiid,amount,selectAmountMode) && userRegistrationDAO.creditAmount(receiverUpiid1 ,amount, selectAmountMode )) {
				return "valid";
			}
		} else if(accountBalance <= amount) {
			return "Invalid";
		}
		return "Invalid";		
	}

	public static List<String> getNames() {
		return list;		
	}
}

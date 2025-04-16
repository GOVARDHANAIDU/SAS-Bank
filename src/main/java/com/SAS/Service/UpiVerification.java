package com.SAS.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.SAS.DAO.AllBankUserDetailsDAO;
import com.SAS.DAO.AllBankUserDetailsImp;
import com.SAS.DTO.BankUserDetails;

public class UpiVerification {
	List<BankUserDetails> bankUserDetailsImp;
	public boolean validUPIID(String upi) {
		
		 AllBankUserDetailsDAO bankUserDetailsDAO = new AllBankUserDetailsImp() ;			
			BankUserDetails bankUserDetails = new BankUserDetails();
		    List<BankUserDetails> list = new ArrayList<BankUserDetails>();		    
		    String Upi_Id = upi;
//		    System.out.println(upi);
			bankUserDetailsImp = bankUserDetailsDAO.SelectAllBankUserDetails();
//			System.out.println(bankUserDetailsImp);
			List<BankUserDetails> upi1 = bankUserDetailsImp.stream().filter((user->user.getUpiid().equals(Upi_Id))).collect(Collectors.toList());
			System.out.println(upi1);
			bankUserDetails = upi1.get(0);
			if(bankUserDetails.getUpiid().equals(Upi_Id))
			{
				return true;
			} else {
				return false;
			}	
			
	}
}

package com.SAS.DAO;

import java.util.List;

import com.SAS.DTO.AccountStatement;
import com.SAS.DTO.BankUserDetails;

public interface Login {
	boolean selectLoginDetails(String emailid , String password);
	
}
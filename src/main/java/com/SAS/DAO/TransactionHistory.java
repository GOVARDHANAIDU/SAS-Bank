package com.SAS.DAO;

import java.util.List;

import com.SAS.DTO.AccountStatement;

public interface TransactionHistory {
	boolean insertHistory(AccountStatement accountStatement);
	List<AccountStatement> selectTotalHistory(int userId);
	
}
package com.SAS.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.net.*;

import com.SAS.DTO.AccountStatement;

public class TransactionHistoryImp implements TransactionHistory {
	private static final String insertDetails =
			"insert into transaction_history(Transaction_Amount, Account_Balance, Date_Of_Transaction, Time_Of_Transaction, Transaction_Type, id, User_Name, Recevie_User_Name, Mode_Of_Transaction)"
			+ "values(?,?,?,?,?,?,?,?,?)";
	private static final String selectAll = "Select * from transaction_history where id = ?";
	
	AccountStatement accountStatement = new AccountStatement();

	@Override
	public boolean insertHistory(AccountStatement accountStatement) {
		
		try {		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection =
					DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(insertDetails);
			preparedStatement.setDouble(1,accountStatement.getTransactionAmount());
			preparedStatement.setDouble(2, accountStatement.getAccountBalance());
			preparedStatement.setDate(3,Date.valueOf(accountStatement.getDateOfTransaction()));
			preparedStatement.setTime(4, Time.valueOf(accountStatement.getTimeOfTransaction()));
			preparedStatement.setString(5, accountStatement.getTypeOfTransaction());
			preparedStatement.setInt(6,accountStatement.getUserId());
			preparedStatement.setString(7, accountStatement.getUserName());
			preparedStatement.setString(8, accountStatement.getRecieverUserName());
			preparedStatement.setString(9, accountStatement.getModeOfTransaction());
			int result = preparedStatement.executeUpdate();
			if(result != 0)
			{
				return true;
			} else {
				return false;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	List<AccountStatement> list = new ArrayList<AccountStatement>();
	@Override
	public List<AccountStatement> selectTotalHistory(int userId) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection =
					DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(selectAll);
			preparedStatement.setInt(1, userId);
			ResultSet result = preparedStatement.executeQuery();
			while(result.next()) {
				AccountStatement accountStatement = new AccountStatement();
				accountStatement.setUserName(result.getString("User_Name"));
				accountStatement.setTransactionAmount(result.getDouble("Transaction_Amount"));
				accountStatement.setDateOfTransaction(result.getDate("Date_Of_Transaction").toLocalDate());
				accountStatement.setTimeOfTransaction(result.getTime("Time_Of_Transaction").toLocalTime());
				accountStatement.setTypeOfTransaction(result.getString("Transaction_Type"));
				accountStatement.setRecieverUserName(result.getString("Recevie_User_Name"));
				accountStatement.setModeOfTransaction(result.getString("Mode_Of_Transaction"));
				list.add(accountStatement);
			}
			return list;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		

		
	}
	

}

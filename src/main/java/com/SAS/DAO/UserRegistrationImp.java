package com.SAS.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.SAS.DTO.AccountStatement;
import com.SAS.DTO.BankUserDetails;
import com.SAS.Service.AccountBalanceValidation;

public class UserRegistrationImp implements UserRegistrationDAO {

	private static final String insertDetails = "insert into user_details(User_Name, Email_ID, Phone_Number, Aadhar_Number, PAN_Number, Address, Pincode,  Status,Password,Account_Number,IFSC_Code,Account_Balance,UPI_ID) "
			+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String updateAmount = "update user_details set Account_Balance = ? where UPI_ID = ? ";
	private static final String creditAmount = "update user_details set Account_Balance = ? where UPI_ID = ? ";
	private static final String getAccountBalance = "select Account_Balance from user_details where UPI_ID = ? ";
	private static final String getUserId = "select Id from user_details where UPI_ID = ? ";
	private static final String getUserName = "select User_Name from user_details where UPI_ID = ? ";
	
	private static final String getReciverUserName = "Select User_Name from user_details where id = ?";
	private static final String getReciverUpiUsingnumber = "Select UPI_ID from user_details where Phone_Number = ?";
	private static final String getReciverUpiUsingAccountNumber = "Select UPI_ID from user_details where Account_Number = ?";
	
	List<AccountStatement> accountStatementList = new ArrayList<AccountStatement>();
	BankUserDetails bankUserDetails = new BankUserDetails();
	String senderUpi;
	double debitAmount ;
	String recevierupi;
	double creditamo ;
	String mode;
	@Override
	public boolean insertDetails(BankUserDetails bankUserDetails) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
				PreparedStatement preparedStatement = connection.prepareStatement(insertDetails);
				preparedStatement.setString(1, bankUserDetails.getUserName());
				preparedStatement.setString(2, bankUserDetails.getEmailid());
				preparedStatement.setLong(3, bankUserDetails.getPhoneNumber());
				preparedStatement.setLong(4, bankUserDetails.getAadharNumber());
				preparedStatement.setString(5, bankUserDetails.getPanNumber());
				preparedStatement.setString(6,bankUserDetails.getAddress());
				preparedStatement.setInt(7, bankUserDetails.getPincode());
				preparedStatement.setString(8,"Approved");
				preparedStatement.setString(9, bankUserDetails.getPassword());
				preparedStatement.setLong(10, bankUserDetails.getAccountNumber());
				preparedStatement.setString(11, bankUserDetails.getIFSCCode());
				preparedStatement.setDouble(12, 2000);
				preparedStatement.setString(13,bankUserDetails.getUpiid());
				int result = preparedStatement.executeUpdate();
				
				if(result != 0)
				{
				  return true;
				}
				else
				{
					return false;
				}
						
	    	}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			 }
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean debitAmountFromAccount(String upi,double amount, String selectAmountMode) {		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
				PreparedStatement preparedStatement = connection.prepareStatement(updateAmount);
				preparedStatement.setDouble(1, getSenderAccountBalance(upi)-amount);
				preparedStatement.setString(2, upi);
				int result = preparedStatement.executeUpdate();
				if(result != 0)
				{
					debitAmount = amount;
					senderUpi = upi;
					mode = selectAmountMode;
					if(setDebitTransactionHistory())
					{
						return true;
					} else {
						return false;
					}

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
	
	@Override
	public boolean creditAmount(String upi, double amount, String selectAmountMode) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(creditAmount);
			preparedStatement.setDouble(1, getAccountBalance(upi)+amount);
			preparedStatement.setString(2, upi);
			int result = preparedStatement.executeUpdate();
			if(result != 0)
			{
				creditamo = amount;
				recevierupi = upi;
				if(setCreditTransactionHistory()) {
					return true;
				} else {
					return false;
				}		
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
	
	@Override
	public double getAccountBalance(String recieverUpiid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getAccountBalance);
			preparedStatement.setString(1, recieverUpiid);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				double receiverBalance = result.getDouble("Account_Balance");
				return receiverBalance;
			} else {
				return 0;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public double getSenderAccountBalance(String senderUpiid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getAccountBalance);
			preparedStatement.setString(1, senderUpiid);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				double senderAccounBalance = result.getDouble("Account_Balance");
				return senderAccounBalance;
			} else {
				return 0;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int getUserId(String Senderupi) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getUserId);
			preparedStatement.setString(1, Senderupi);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				int senderId = result.getInt("Id");			
				return senderId;
			} else {
				return 0;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public String getUserName(String Senderupi) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getUserName);
			preparedStatement.setString(1, Senderupi);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				String senderId = result.getString("User_Name");			
				return senderId ;
			} else {
				return null;
			}
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
	
	TransactionHistory transactionHistory = new TransactionHistoryImp();
	public boolean setDebitTransactionHistory(){
		AccountStatement accountStatement = new AccountStatement();
		accountStatement.setAccountBalance(getAccountBalance(this.senderUpi));
		accountStatement.setDateOfTransaction(LocalDate.now());
		accountStatement.setTimeOfTransaction(LocalTime.now());
		accountStatement.setTransactionAmount(this.debitAmount);
		accountStatement.setTypeOfTransaction("Debit");
		accountStatement.setUserId(getUserId(this.senderUpi));
		accountStatement.setUserName(getUserName(this.senderUpi));	
		accountStatement.setModeOfTransaction(this.mode);
		System.out.println("Mode of transaction "+this.mode);
		String recevierUpiid = "";
		for(String upiid :  AccountBalanceValidation.getNames()) 
		{
			recevierUpiid = upiid;
		}
		String verifiedName = getUserName(recevierUpiid) ;
		accountStatement.setRecieverUserName(verifiedName);
		boolean status = transactionHistory.insertHistory(accountStatement);
		if(status == true)
		{
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean setCreditTransactionHistory() {
		AccountStatement accountStatement = new AccountStatement();
		accountStatement.setAccountBalance(getAccountBalance(this.recevierupi));
		accountStatement.setDateOfTransaction(LocalDate.now());
		accountStatement.setTimeOfTransaction(LocalTime.now());
		accountStatement.setTransactionAmount(this.creditamo);
		accountStatement.setTypeOfTransaction("Credit");
		accountStatement.setUserId(getUserId(this.recevierupi));
		accountStatement.setUserName(getUserName(this.recevierupi));
		accountStatement.setRecieverUserName(getUserName(this.senderUpi));
		accountStatement.setModeOfTransaction(this.mode);
		boolean status = transactionHistory.insertHistory(accountStatement);
		
		if(status == true)
		{
			return true;
		} else {
			return false;
		}
	}
	@Override
	public String getReceiverUserName(String receiverUpi) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getUserName);
			preparedStatement.setString(1, receiverUpi);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				String name = result.getString("User_Name");
				return name ;
			} else {
				return null;
			}
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
	@Override
	public String getReceiverUpiUsingPhoneNumber(long number) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getReciverUpiUsingnumber);
			preparedStatement.setLong(1, number);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				String name = result.getString("UPI_ID");
				return name ;
			} else {
				return null;
			}
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
	@Override
	public String getReceiverUpiUsingAccountNumber(long Accnumber) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(getReciverUpiUsingAccountNumber);
			preparedStatement.setLong(1, Accnumber);
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				String upi = result.getString("UPI_ID");
				
				return upi ;
			} else {
				return null;
			}
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

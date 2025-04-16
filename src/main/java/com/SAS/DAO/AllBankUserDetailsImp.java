package com.SAS.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.SAS.DTO.BankUserDetails;

public class AllBankUserDetailsImp implements AllBankUserDetailsDAO{
//	BankUserDetails bankUserDetails = new BankUserDetails();
	List<BankUserDetails> list = new ArrayList<BankUserDetails>();
    private static final String selectAll = "select * from user_details";
	@Override
	public List<BankUserDetails> SelectAllBankUserDetails() {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(selectAll);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.isBeforeFirst()) {	
				while(resultSet.next())
				{
     				BankUserDetails bankUserDetails = new BankUserDetails();
					bankUserDetails.setUserName(resultSet.getString("User_Name"));
					bankUserDetails.setId(resultSet.getInt("id"));
					bankUserDetails.setAadharNumber(resultSet.getLong("Aadhar_Number"));
					bankUserDetails.setAccountNumber(resultSet.getLong("Account_Number"));
					bankUserDetails.setPhoneNumber(resultSet.getLong("Phone_Number"));
					bankUserDetails.setAccountBalance(resultSet.getDouble("Account_Balance"));
					bankUserDetails.setUpiid(resultSet.getString("UPI_ID"));
					bankUserDetails.setEmailid(resultSet.getString("Email_ID"));
					bankUserDetails.setPanNumber(resultSet.getString("PAN_Number"));
					bankUserDetails.setAddress(resultSet.getString("Address"));
					bankUserDetails.setIFSCCode(resultSet.getString("IFSC_Code"));
					bankUserDetails.setPincode(resultSet.getInt("Pincode"));
					list.add(bankUserDetails);
				}
				return list;	
			}
			else
			{
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

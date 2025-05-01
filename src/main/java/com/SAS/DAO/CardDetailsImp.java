package com.SAS.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.SAS.DTO.CardDetailsClass;
import com.controller.TestEmailOtp;

public class CardDetailsImp implements CardDetails{
	private static final String select = "select * from card_details where Credit_Card_Number = ? and CVV = ?";
	private static final String insertCard = "insert into card_details(Credit_Card_Number, Debit_Card_Number, Expiry_Month, Expiry_Year, User_ID, User_Name, CVV, Emp_Status, Account_Number)"
			+ "values(?,?,?,?,?,?,?,?,?)";
	private static final String selectEmail = "select Email_ID from user_details where id = ?";
	private static List<String> list = new ArrayList<String>();
	@Override
	public boolean validLoginDetails(Long cardNumber, int cvv) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection =
					DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(select);
			preparedStatement.setLong(1, cardNumber);
			preparedStatement.setInt(2, cvv);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.isBeforeFirst()) {				
				if(resultSet.next()) {
					String name = resultSet.getString("User_Name");
					int id = resultSet.getInt("User_ID");
					String emailId = getEmailid(id);
					String otp = TestEmailOtp.otpVerification(emailId);					
					if(otp!=null) {
						list.add(otp);
						System.out.println(list);
						return true;
					}
				}	
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
		return false;
	}
	
	@Override
	public boolean insertCardDetails(CardDetailsClass cardDetailsClass) {
//		card_id, Credit_Card_Number, Debit_Card_Number, Expiry_Month, Expiry_Year, User_ID, User_Name, CVV, Emp_Status, Account_Number
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection =
					DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(insertCard);
			preparedStatement.setLong(1, cardDetailsClass.getCreditCardNumber());
			preparedStatement.setLong(2, cardDetailsClass.getDebitCardNumber());
			preparedStatement.setInt(3, cardDetailsClass.getExpMonth());
			preparedStatement.setInt(4, cardDetailsClass.getExpYear());
			preparedStatement.setInt(5, cardDetailsClass.getUserId());
			preparedStatement.setString(6, cardDetailsClass.getUserName());
			preparedStatement.setInt(7, cardDetailsClass.getCvv());
			preparedStatement.setString(8, cardDetailsClass.getEmpStatus());
			preparedStatement.setLong(9, cardDetailsClass.getAccNo());
			int result = preparedStatement.executeUpdate();
			if(result != 0) {
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
	
	@Override
	public String getEmailid(int id) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection =
					DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(selectEmail);
			preparedStatement.setLong(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.isBeforeFirst()) {				
				if(resultSet.next()) {
					return resultSet.getString("Email_ID");
				}				
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
		return null;
	}
	
	public static List<String> setOtp(){
		System.out.println("list contains:"+list);
		return list;		
	}
	
}

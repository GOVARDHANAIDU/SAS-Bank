package com.SAS.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.SAS.Service.AccountBalanceValidation;
import com.controller.VerifyPinServlet;

public class UpiVerifiedWithNameImp implements UpiVerifiedWithName {
	private static final String select_all ="select * from user_details where UPI_ID = ? ";
	AccountBalanceValidation accountBalanceValidation = new AccountBalanceValidation();
	@Override
	public String NameVerification(String upiID) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12773883","sql12773883","r71iFqJHWT");
			PreparedStatement preparedStatement = connection.prepareStatement(select_all);
			preparedStatement.setString(1,upiID);
			ResultSet resultSet = preparedStatement.executeQuery();
			// System.out.println(resultSet);
			
			while (resultSet.isBeforeFirst()) {				
	     	     if(resultSet.next())
			     {      	    	
	     	    	String name = resultSet.getString("User_Name");	     	    	     	    	
			        return name;
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
		return upiID;		
	}
	

}

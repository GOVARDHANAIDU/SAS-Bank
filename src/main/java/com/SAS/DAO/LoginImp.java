package com.SAS.DAO;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.SAS.DTO.AccountStatement;
import com.SAS.DTO.BankUserDetails;
import com.controller.LoginPage;

public class LoginImp implements Login {
    private static final String select_all ="select * from user_details where Email_ID = ? and Password = ? ";
    LoginPage loginPage = new LoginPage();
	@Override
	public boolean selectLoginDetails(String emailid, String password) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
			PreparedStatement preparedStatement = connection.prepareStatement(select_all);
			preparedStatement.setString(1,emailid);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();
			// System.out.println(resultSet);
			
			while (resultSet.isBeforeFirst()) {				
	     	     if(resultSet.next())
			     { 
	     	    	
	     	    	String name = resultSet.getString("User_Name");	     	    	
	     	    	String upiid = resultSet.getString("UPI_ID");
	     	    	String temp_amount = resultSet.getString("Account_Balance");
	     	    	int id = resultSet.getInt("id");
	     	    	double amount = Double.parseDouble(temp_amount);
	     			loginPage.userName(name,upiid,amount,id);
			        return true;
			     }
			     else {			    	 
			       return false;
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
	
}

	

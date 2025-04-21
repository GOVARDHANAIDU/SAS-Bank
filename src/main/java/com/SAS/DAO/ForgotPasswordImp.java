package com.SAS.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ForgotPasswordImp implements ForgotPasswordDAO {
	private static final String select = "Select * from user_details where Email_ID = ?";
	private static final String update = "update user_details set Password= ? where Email_ID = ?";
	String url = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12773883"; // Host & DB name
        String username = "sql12773883";   // Hosting DB username
        String password = "r71iFqJHWT";   // Hosting DB password
	@Override
	public boolean checkingEmailID(String emailid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12773883","sql12773883","r71iFqJHWT");
			PreparedStatement preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, emailid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.isBeforeFirst())
			{
				if(resultSet.next()) {
					return true;				
				} else {				
					return false;
				}
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
		return false;
	}

	@Override
	public boolean UpdatePassword(String emailid, String confirmPassword) {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12773883","sql12773883","r71iFqJHWT");
			PreparedStatement preparedStatement = connection.prepareStatement(update);
			preparedStatement.setString(1, confirmPassword);
			preparedStatement.setString(2, emailid);
			int result = preparedStatement.executeUpdate();
			System.out.println(result);
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
	

}






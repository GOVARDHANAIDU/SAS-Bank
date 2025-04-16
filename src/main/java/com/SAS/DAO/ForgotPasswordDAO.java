package com.SAS.DAO;

public interface ForgotPasswordDAO {
boolean checkingEmailID(String emailid);
boolean UpdatePassword(String emailid, String confirmPassword);
}

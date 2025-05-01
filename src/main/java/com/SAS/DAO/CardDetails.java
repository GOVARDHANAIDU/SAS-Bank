package com.SAS.DAO;

import com.SAS.DTO.CardDetailsClass;
import com.SAS.Service.CreditCardValidation;

public interface CardDetails {
	boolean validLoginDetails(Long cardNumber, int cvv);
	String getEmailid(int id);
	boolean insertCardDetails(CardDetailsClass cardDetailsClass);
}

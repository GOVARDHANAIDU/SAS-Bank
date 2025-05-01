package com.SAS.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CardDetailsClass {
	private int it;
	private long creditCardNumber;
	private long debitCardNumber;
	private int expMonth;
	private int expYear;
	private int userId;
	private String userName;
	private int cvv;
	private String empStatus;
	private long accNo;
}

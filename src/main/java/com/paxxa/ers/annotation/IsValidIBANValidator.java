package com.paxxa.ers.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.paxxa.ers.service.BankAccountService;

public class IsValidIBANValidator implements ConstraintValidator<IsValidIBAN, String> {
	
	@Autowired
	private BankAccountService bankAccountService;
	

	@Override
	public void initialize(IsValidIBAN constraintAnnotation) {
		
	}

	@Override
	public boolean isValid(String bankAccountNumber, ConstraintValidatorContext context) {
		if(bankAccountService == null){
			return true;
		}
		return false;
	}

}

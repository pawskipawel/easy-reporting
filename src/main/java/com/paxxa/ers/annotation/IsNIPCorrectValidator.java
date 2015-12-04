package com.paxxa.ers.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.paxxa.ers.service.CompanyService;

public class IsNIPCorrectValidator implements ConstraintValidator<IsNIPCorrect, String> {
	
	@Autowired
	private CompanyService companyService;

	@Override
	public void initialize(IsNIPCorrect constraintAnnotation) {
		
	}

	@Override
	public boolean isValid(String nip, ConstraintValidatorContext context) {
		/*
		 * During compilation companyService is null so it will retrieve nullPointExceptio
		 * To avoid that we give this extra condition 
		 */
		if(companyService == null){
			return true;
		}
		return companyService.isNipCorrect(nip);
	}

}
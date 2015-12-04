package com.paxxa.ers.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.paxxa.ers.repository.UserRepository;

public class UniqueUsernameValidator implements ConstraintValidator<UniqueUserName, String> {
	
	@Autowired
	private UserRepository UserRepository;

	@Override
	public void initialize(UniqueUserName constraintAnnotation) {
		
	}

	@Override
	public boolean isValid(String username, ConstraintValidatorContext context) {
		/*
		 * During compilation userRepository is null so it will retrieve nullPointExceptio
		 * To avoid that we give this extra condition 
		 */
		if(UserRepository == null){
			return true;
		}
		return UserRepository.findByName(username)==null;
	}

}


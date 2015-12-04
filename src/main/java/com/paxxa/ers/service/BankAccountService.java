package com.paxxa.ers.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.validator.routines.checkdigit.IBANCheckDigit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.BankAccount;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.repository.BankAccountRepository;


@Transactional
@Service
public class BankAccountService {
	
	@Autowired
	BankAccountRepository bankAccountRepository;

	public List<BankAccount> findBankAccountsByCompany(Company company) {
		return bankAccountRepository.findByCompany(company);
	}

	public void saveAndFlush(BankAccount bankAccount) {
		bankAccountRepository.saveAndFlush(bankAccount);
	}

	public List<BankAccount> findByCompanyNotDeletedBankAccounts(Company comapny) {
		return bankAccountRepository.findByCompanyAndIsDeletedIsFalse(comapny);
	}

	public void saveOrUpdate(BankAccount bankAccount) {
		bankAccountRepository.save(bankAccount);
	}

	public BankAccount findById(Integer id) {
		return bankAccountRepository.findById(id);
	}

	public BankAccount findCurrentBankAccountAsDefaultInvoice(Company company) {
		return bankAccountRepository.findByIsDeafultBankAccountInvoiceIsTrue(company);
	}

	public Boolean isValidBankAccountNumber(String bankAccountNumber){
		IBANCheckDigit bankAccountValidator = new IBANCheckDigit();
		String ibanPrefix = "PL";
		String bankAccount = ibanPrefix+bankAccountNumber.replaceAll("\\s+","");
		Boolean isCorrect = bankAccountValidator.isValid(bankAccount);
		return isCorrect;
	}

}

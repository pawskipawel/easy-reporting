package com.paxxa.ers.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.BankAccount;
import com.paxxa.ers.entity.Company;

public interface BankAccountRepository extends JpaRepository<BankAccount, Integer>{

	List<BankAccount> findByCompany(Company company);
	
	List<BankAccount> findByCompanyAndIsDeletedIsFalse(Company company);

	BankAccount findById(Integer id);

}

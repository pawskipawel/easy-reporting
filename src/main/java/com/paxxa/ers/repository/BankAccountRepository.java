package com.paxxa.ers.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.BankAccount;

public interface BankAccountRepository extends JpaRepository<BankAccount, Integer>{

}

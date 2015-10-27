package com.paxxa.ers.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;

public interface CompanyRepository extends JpaRepository<Company, Integer>{

	Company findByUsers(List<User> users);
	

}

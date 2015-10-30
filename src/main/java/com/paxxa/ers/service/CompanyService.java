package com.paxxa.ers.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.repository.AddressRepository;
import com.paxxa.ers.repository.CompanyRepository;

@Service
@Transactional
public class CompanyService {

	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	AddressRepository addressRepository;

	
	public void create(Company company){
		companyRepository.save(company);
	}
	
	
	public void save(Company company){
		companyRepository.save(company);
	}
	
	public void saveAndFlush(Company company){
		companyRepository.save(company);
	}


	public Company findCompanyByUser(List<User> user) {
		return companyRepository.findByUsers(user);
		
	}


	public void saveOrUpdate(Company company) {
		companyRepository.save(company);
		
	}
	
	


	

}

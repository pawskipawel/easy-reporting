package com.paxxa.ers.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.repository.CompanyRepository;
import com.paxxa.ers.repository.RoleRepository;
import com.paxxa.ers.repository.UserRepository;

@Transactional
@Service
public class AdminService {

	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	

	public List<Company> findAllCompanies() {
		return companyRepository.findAll();
	}

	public List<User> findAllUsers() {
		return userRepository.findAll();
	}

	@Transactional
	public Company findOneCompanyWithUsers(int id) {
		Company company = companyRepository.findOne(id);
		List<User> users = userRepository.findByCompany(company);
		company.setUsers(users);
		return company;
	}
}

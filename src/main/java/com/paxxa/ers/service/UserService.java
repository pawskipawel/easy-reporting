package com.paxxa.ers.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.Role;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.repository.CompanyRepository;
import com.paxxa.ers.repository.RoleRepository;
import com.paxxa.ers.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	private CompanyRepository companyRepository;
	
	@Transactional
	public void create(User user) {
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName("ROLE_USER"));
		user.setRoles(roles);
		userRepository.save(user);
	}

	
	public User findUser(String name) {
		User user = userRepository.findByName(name);
		return user;
	}
	
	@Transactional
	public Company findOneCompany(int id) {
		Company company = companyRepository.findOne(id);
		List<User> users = userRepository.findByCompany(company);
		company.setUsers(users);
		return company;
	}


	public void upDate(User user) {
		userRepository.save(user);	
	}
	
	public void saveAndFlush(User user) {
		userRepository.save(user);	
	}


	public void saveOrUpdate(User user) {
		userRepository.save(user);	
		
	}
	
	

	
	
}

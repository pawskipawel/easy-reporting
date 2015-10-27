package com.paxxa.ers.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;

/*To create repository we need to create interface for each entity with 
name starting from entities name + "Repository" word. 
Interfaces need to extend JpaRepository<Entiti name, Integer for serialization>*/

public interface UserRepository extends JpaRepository<User, Integer> {

	//Spring JPA will auto generate implementation of this method. 
	List<User> findByCompany(Company company);

	User findByName(String name);
	
}

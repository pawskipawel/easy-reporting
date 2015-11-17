package com.paxxa.ers.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.Company;

public interface AddressRepository extends JpaRepository<Address, Integer>{

	Address findByCompany(List<Company> company);

	List<Address> findByCompany(Company company);
	
	List<Address> findByCompanyAndIsDeletedIsFalse(Company company);

	Address findById(Integer id);

}

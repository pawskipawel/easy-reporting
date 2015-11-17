package com.paxxa.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.repository.AddressRepository;

@Service
public class AddresService {

	@Autowired
	AddressRepository addressRepository;

	public Address findAddressByCompany(List<Company> company) {
		return addressRepository.findByCompany(company);
	}

	public void create(Address address) {
		addressRepository.save(address);
	}

	public void upDate(Address address) {
		addressRepository.save(address);
	}

	public void saveAndFlush(Address address) {
		addressRepository.saveAndFlush(address);
		
	}

	public List<Address> findAddressesByCompany(Company company) {
		return addressRepository.findByCompany(company);
	}
	
	public List<Address> findByCompanyNotDeletedAddresses(Company company){
		return addressRepository.findByCompanyAndIsDeletedIsFalse(company);
	}

	public void saveOrUpdate(Address address) {
		addressRepository.save(address);
	}

	public Address findById(Integer id) {
		return addressRepository.findById(id);
	}
}

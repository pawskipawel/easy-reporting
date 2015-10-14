package com.paxxa.ers.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.Address;

public interface AddressRepository extends JpaRepository<Address, Integer>{

}

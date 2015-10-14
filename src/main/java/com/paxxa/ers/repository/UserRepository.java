package com.paxxa.ers.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}

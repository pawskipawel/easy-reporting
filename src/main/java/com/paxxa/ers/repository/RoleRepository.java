package com.paxxa.ers.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.Role;
import com.paxxa.ers.entity.User;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	List<Role> findByUsers(User user);

}

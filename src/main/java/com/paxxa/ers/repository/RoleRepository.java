package com.paxxa.ers.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.paxxa.ers.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	List<Role> findByUsersCompanyId(Integer id);

	Role findByName(String name);


}

package com.paxxa.ers.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class User {

	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;

	
	private String email;

	private String password;
	
	private boolean enabled;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	private Company companys;

	@ManyToMany
	@JoinTable
	private List<Role> roles;
}

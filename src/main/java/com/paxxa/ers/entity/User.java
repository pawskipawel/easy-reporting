package com.paxxa.ers.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import com.paxxa.ers.annotation.UniqueUserName;



@Entity
public class User {

	@Id
	@GeneratedValue
	private Integer id;
	
	@Size(min=3, max= 15, message="Name must be at least 3 characters and maximum 15 characters long")
	@Column(unique = true)
	@UniqueUserName(message="Such a user name already exists")
	private String name;

	@Size(min=1, message="Email must be at least 1 characters")
	@Email(message="Invalid email address!")
	private String email;

	private String password;
	
	private boolean enabled;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	private Company company;

	@ManyToMany
	@JoinTable
	private List<Role> roles;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	
}

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
public class Consultant {

	@Id
	@GeneratedValue
	private Integer id;

	private String name;

	private String password;

	private String email;

	@ManyToMany
	@JoinTable
	private List<Role> roles;
	
	@ManyToOne
	@JoinColumn( name="menager_id")
	private Menager menager;
	
	@ManyToMany (mappedBy="consultants")
	private List<Report> reports;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Menager getMenager() {
		return menager;
	}

	public void setMenager(Menager menager) {
		this.menager = menager;
	}

	public List<Report> getReports() {
		return reports;
	}

	public void setReports(List<Report> reports) {
		this.reports = reports;
	}
	
	

}

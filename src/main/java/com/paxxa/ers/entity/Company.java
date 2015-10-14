package com.paxxa.ers.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Company {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "company_name")
	private String companyName;

	private Integer nip;

	private Integer phone;

	@OneToMany(mappedBy="companys")
	private List<Address> address;

	@OneToMany(mappedBy = "companys")
	private List<User> users;
	
	@OneToMany(mappedBy="company")
	private List<Invoice> invoices;

}

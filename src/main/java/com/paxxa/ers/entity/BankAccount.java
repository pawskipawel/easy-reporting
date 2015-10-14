package com.paxxa.ers.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class BankAccount {

	@Id
	@GeneratedValue
	private Integer id;

	private Integer account;

	private String description;

	@OneToMany(mappedBy="bankAccount")
	private List<Invoice> invoices;

}

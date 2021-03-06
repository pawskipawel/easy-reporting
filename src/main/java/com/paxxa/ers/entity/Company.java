package com.paxxa.ers.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import com.paxxa.ers.annotation.IsNIPCorrect;

@Entity
public class Company {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "company_name")
	@Size(min=3, max= 30, message="Name must be at least 3 characters and maximum 30 characters long")
	private String companyName;

	@IsNIPCorrect(message="incorrect NIP number")
	private String nip;

	private Long phone;

	private String email;

	@Column(name = "registration_date")
	private Date registrationDate;

	@OneToMany(mappedBy = "company")
	private List<Address> addresses;

	@OneToMany(mappedBy = "company")
	private List<User> users;

	@OneToMany(mappedBy = "company")
	private List<Invoice> invoices;

	@OneToMany(mappedBy = "company")
	private List<BankAccount> bankAccount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}



	public List<BankAccount> getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(List<BankAccount> bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}

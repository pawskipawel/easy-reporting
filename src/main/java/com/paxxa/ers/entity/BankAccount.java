package com.paxxa.ers.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.paxxa.ers.annotation.IsValidIBAN;

@Entity
public class BankAccount {

	@Id
	@GeneratedValue
	private Integer id;

	@IsValidIBAN(message="incorrect bank account number")
	private String accountNumber;

	private String description;

	@ManyToOne
	@OneToOne
	private Company company;

	private Boolean isDeafultBankAccountInvoice = false;
	
	private Boolean isDeleted = false;

	@OneToMany(mappedBy = "bankAccount")
	private List<Invoice> invoices;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}


	public Boolean getIsDeafultBankAccountInvoice() {
		return isDeafultBankAccountInvoice;
	}

	public void setIsDeafultBankAccountInvoice(Boolean isDeafultBankAccountInvoice) {
		this.isDeafultBankAccountInvoice = isDeafultBankAccountInvoice;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	
	
	

}

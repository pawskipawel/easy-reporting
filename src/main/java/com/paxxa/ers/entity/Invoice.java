package com.paxxa.ers.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Invoice {

	
	@Id
	@GeneratedValue
	private Integer id;
	
	private Boolean enabled;
	
	@Column(name="invoice_number")
	private String invoiceNumber;
	
	@Column (name="invoice_date")
	private Date invoiceDate;
	
	@Column (name="issuedDate")
	private Date issuedDate;
	
	private String locationStamp;
	
	private String payed;
	
	private String leftToPay;
	
	@ManyToOne
	@JoinColumn(name="payment_terms_id")
	private PaymentTerms paymentTerms;
	
	@ManyToOne
	@JoinColumn(name="payment_type_id")
	private PaymentType paymentType;
	
	@ManyToOne
	@JoinColumn(name="accound_id")
	private BankAccount bankAccount;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	private Company company;
	
	
	
	
	
	
	
	
	
	
}

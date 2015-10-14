package com.paxxa.ers.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Address {

	@Id
	@GeneratedValue
	private Integer id;

	private String street;

	@Column(name = "street_number")
	private String streetNumber;

	private String zipcode;

	private String city;

	private String email;

	@ManyToOne
	@JoinColumn
	private Company companys;

}

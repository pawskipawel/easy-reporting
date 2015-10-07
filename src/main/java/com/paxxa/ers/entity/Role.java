package com.paxxa.ers.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Role {

	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;

	@ManyToMany(mappedBy="roles")
	private List<Menager> menagers;
	
	@ManyToMany(mappedBy="roles")
	private List<Consultant> consultants;

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

	public List<Menager> getMenagers() {
		return menagers;
	}

	public void setMenagers(List<Menager> menagers) {
		this.menagers = menagers;
	}

	public List<Consultant> getConsultants() {
		return consultants;
	}

	public void setConsultants(List<Consultant> consultants) {
		this.consultants = consultants;
	}
	
	
	
}

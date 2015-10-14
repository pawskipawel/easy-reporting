package com.paxxa.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Menager;
import com.paxxa.ers.repository.MenagerRepository;

@Service
public class MenagerService {

	@Autowired
	private MenagerRepository menagerRepository;
	
	public List<Menager> findAll() {
		return menagerRepository.findAll();
	}
}

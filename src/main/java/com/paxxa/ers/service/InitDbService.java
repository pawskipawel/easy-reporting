/*package com.paxxa.ers.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Consultant;
import com.paxxa.ers.entity.Menager;
import com.paxxa.ers.entity.Report;
import com.paxxa.ers.entity.Role;
import com.paxxa.ers.repository.ConsultantRepository;
import com.paxxa.ers.repository.MenagerRepository;
import com.paxxa.ers.repository.ReportRepository;
import com.paxxa.ers.repository.RoleRepository;

@Transactional 
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private MenagerRepository menagerRepository;

	@Autowired
	private ConsultantRepository consultantRepository;

	@Autowired
	private ReportRepository reportRepository;

	@PostConstruct
	public void init() {

		Role roleAdmin = new Role();
		roleAdmin.setName("Role_ADMIN");
		roleRepository.save(roleAdmin);
		

		Role roleMenager = new Role();
		roleMenager.setName("Role_MENAGER");
		roleRepository.save(roleMenager);

		Role roleUser = new Role();
		roleUser.setName("Role_USER");
		roleRepository.save(roleMenager);
		
		Menager admin = new Menager();
		admin.setCompanyName("admin LTD");
		admin.setEmail("admin@hotmail.com");
		admin.setEnabled(true);
		admin.setName("admin");
		admin.setPassword("admin");
		List<Role> rolesAdmin = new ArrayList<Role>();
		rolesAdmin.add(roleUser);
		rolesAdmin.add(roleMenager);
		rolesAdmin.add(roleAdmin);
		menagerRepository.save(admin);

		Menager paxxa = new Menager();
		paxxa.setCompanyName("Paxxa Ltd");
		paxxa.setEmail("paw.saw@hotmail.com");
		paxxa.setEnabled(true);
		paxxa.setName("Paxxa");
		paxxa.setPassword("Paxxa");
		List<Role> rolesMenager = new ArrayList<Role>();
		rolesMenager.add(roleUser);
		rolesMenager.add(roleMenager);
		menagerRepository.save(paxxa);

		Consultant consult1 = new Consultant();
		consult1.setEnabled(true);
		consult1.setName("consul");
		consult1.setPassword("consul");
		consult1.setEmail("consul@hotmail.com");
		consult1.setMenager(paxxa);
		consultantRepository.save(consult1);

		Report report1 = new Report();
		report1.setReportDay(new Date());
		report1.setContractExtentionNum(5);
		report1.setFutureMeetingNum(4);
		report1.setNewContractNum(10);
		report1.setTodayMeetingNum(2);
		report1.setConsultant(consult1);
		reportRepository.save(report1);

		Report report2 = new Report();
		report2.setReportDay(new Date());
		report2.setContractExtentionNum(12);
		report2.setFutureMeetingNum(7);
		report2.setNewContractNum(30);
		report2.setTodayMeetingNum(32);
		report2.setConsultant(consult1);
		reportRepository.save(report2);
	}
}
*/
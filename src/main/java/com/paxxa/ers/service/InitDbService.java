package com.paxxa.ers.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.BankAccount;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.Invoice;
import com.paxxa.ers.entity.PaymentTerms;
import com.paxxa.ers.entity.PaymentType;
import com.paxxa.ers.entity.Role;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.repository.AddressRepository;
import com.paxxa.ers.repository.BankAccountRepository;
import com.paxxa.ers.repository.CompanyRepository;
import com.paxxa.ers.repository.InvoiceRepository;
import com.paxxa.ers.repository.PaymentTermsRepository;
import com.paxxa.ers.repository.PaymentTypeRepository;
import com.paxxa.ers.repository.RoleRepository;
import com.paxxa.ers.repository.UserRepository;

@Transactional
@Service
public class InitDbService {

	@Autowired
	RoleRepository roleRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	AddressRepository addressRepository;
	@Autowired
	BankAccountRepository bankAccountRepository;
	@Autowired
	PaymentTypeRepository paymentTypeRepository;
	@Autowired
	PaymentTermsRepository paymentTermsRepository;
	@Autowired
	InvoiceRepository invoiceRepository;
	
	
	@PostConstruct
	public void init() {

		Role roleAdmin = new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);

		Role roleMenager = new Role();
		roleMenager.setName("ROLE_MENAGER");
		roleRepository.save(roleMenager);

		Role roleUser = new Role();
		roleUser.setName("ROLE_USER");
		roleRepository.save(roleUser);

		User john = new User();
		john.setEmail("john@hotmailcom");
		john.setEnabled(true);
		john.setName("admin");
		BCryptPasswordEncoder encoderJohn = new BCryptPasswordEncoder(); 
		john.setPassword(encoderJohn.encode("admin"));
		List<Role> johnRoles = new ArrayList<Role>();
		johnRoles.add(roleAdmin);
		john.setRoles(johnRoles);
		userRepository.save(john);
		
		User jim = new User();
		jim.setEmail("jim@gmail.com");
		jim.setEnabled(true);
		jim.setName("jim");
		BCryptPasswordEncoder encoderjim = new BCryptPasswordEncoder();
		jim.setPassword(encoderjim.encode("1"));
		List<Role> jimRoles = new ArrayList<Role>();
		jimRoles.add(roleUser);
		jim.setRoles(jimRoles);
		userRepository.save(jim);

		Company companyX = new Company();
		companyX.setCompanyName("testCompany");
		companyX.setEmail("companyX@gmail.com");
		companyX.setPhone(792600330L);
		companyX.setNip(5641713529L);
		companyX.setRegistrationDate(new Date());
		companyRepository.save(companyX);
		
		
		
		User ann = new User();
		ann.setEmail("Ann@gmail.com");
		ann.setEnabled(true);
		ann.setName("Ann");
		BCryptPasswordEncoder encoderAnn = new BCryptPasswordEncoder();
		ann.setPassword(encoderAnn.encode("Ann"));
		List<Role> annRoles = new ArrayList<Role>();
		annRoles.add(roleUser);
		ann.setRoles(annRoles);
		userRepository.save(ann);
		
		Company companyZ = new Company();
		companyZ.setCompanyName("CompanyZ");
		companyZ.setPhone(985987468L);
		companyZ.setNip(5846985782L);
		companyZ.setRegistrationDate(new Date());
		List<User> companyZusers = new ArrayList<User>();
		companyZusers.add(ann);
		companyZ.setUsers(companyZusers);
		companyRepository.save(companyZ);
		
		jim.setCompany(companyX);
		userRepository.save(jim);
		
		john.setCompany(companyZ);
		userRepository.save(john);
		
		ann.setCompany(companyZ);
		userRepository.save(ann);

		Address addressCompanyX = new Address();
		addressCompanyX.setStreet("Zana");
		addressCompanyX.setStreetNumber("234");
		addressCompanyX.setZipcode("20-600");
		addressCompanyX.setCity("Lublin");
		addressCompanyX.setCompany(companyZ);
		addressRepository.save(addressCompanyX);
		
		BankAccount bankAccount1CompanyX = new BankAccount();
		bankAccount1CompanyX.setAccount("101010101010101010101010");
		bankAccount1CompanyX.setDescription("mbank");
		bankAccount1CompanyX.setCompany(companyZ);
		bankAccount1CompanyX.setDeafult(true);
		bankAccountRepository.save(bankAccount1CompanyX);
		
		PaymentType paymentTypeCash = new PaymentType();
		paymentTypeCash.setPaymentType("gotówka");
		paymentTypeRepository.save(paymentTypeCash);
		
		PaymentType paymentTypeBankTransfer = new PaymentType();
		paymentTypeBankTransfer.setPaymentType("przelew");
		paymentTypeRepository.save(paymentTypeBankTransfer);
		paymentTypeRepository.save(paymentTypeBankTransfer);
		
		PaymentTerms paymentTerms1day = new PaymentTerms();
		paymentTerms1day.setDescription("1 dzieñ");
		paymentTermsRepository.save(paymentTerms1day);

		PaymentTerms paymentTerms5days = new PaymentTerms();
		paymentTerms5days.setDescription("5 dni");
		paymentTermsRepository.save(paymentTerms5days);
		
		PaymentTerms paymentTerms1week = new PaymentTerms();
		paymentTerms1week.setDescription("1 tydzieñ");
		paymentTermsRepository.save(paymentTerms1week);
		
		PaymentTerms paymentTerms2weeks = new PaymentTerms();
		paymentTerms2weeks.setDescription("2 tygodnie");
		paymentTermsRepository.save(paymentTerms2weeks);
		
		Invoice invoice1 = new Invoice();
		invoice1.setCompany(companyZ);
		invoice1.setEnabled(true);
		invoice1.setInvoiceDate(new Date());
		invoice1.setIssuedDate(new Date());
		invoice1.setInvoiceNumber("1/2015");
		invoice1.setLocationStamp("Lublin");
		invoice1.setLeftToPay("1");
		invoice1.setPayed("zap³acono");
		invoice1.setPaymentTerms(paymentTerms1week);
		invoice1.setPaymentType(paymentTypeCash);
		invoiceRepository.save(invoice1);
		
	}
}

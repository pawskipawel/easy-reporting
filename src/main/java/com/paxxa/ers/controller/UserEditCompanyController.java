package com.paxxa.ers.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.service.AddresService;
import com.paxxa.ers.service.CompanyService;
import com.paxxa.ers.service.UserService;

@Transactional
@Controller
public class UserEditCompanyController {

	private static final Logger logger = Logger.getLogger(UserEditCompanyController.class); 
	@Autowired
	UserService userService;
	@Autowired
	CompanyService companyService;
	@Autowired
	AddresService addressService;

	

	@ModelAttribute("company")
	public Company initCompany() {
		return new Company();
	}


	@Transactional
	@RequestMapping(value = "/user-settings/edit-company", method = RequestMethod.POST)
	public String doEditCompany(@ModelAttribute("company") Company formCompany, Model model, Principal principal,
			BindingResult result, final RedirectAttributes redirectAttributes) {
		String name = principal.getName();
		User currentUser = userService.findUser(name);

		logger.debug("edit company - post");

		List<User> users = new ArrayList<User>();
		users.add(currentUser);

		// Company entity
		if (companyService.findCompanyByUser(users) != null) {
			Company existingCompany = companyService.findCompanyByUser(users);
			existingCompany.setCompanyName(formCompany.getCompanyName());
			existingCompany.setNip(formCompany.getNip());
			existingCompany.setPhone(formCompany.getPhone());
			existingCompany.setEmail(formCompany.getEmail());
			companyService.saveAndFlush(existingCompany);
			userService.saveAndFlush(currentUser);
		}
		if (companyService.findCompanyByUser(users) == null) {
			formCompany.setUsers(users);
			companyService.create(formCompany);
			currentUser.setCompany(formCompany);
			userService.saveAndFlush(currentUser);
		}

		// Address entity
		List<Company> companyInList = new ArrayList<Company>();
		companyInList.add(companyService.findCompanyByUser(users));
		if (!addressService.findAddressesByCompany(companyService.findCompanyByUser(users)).isEmpty()) {
			
			logger.info("Address list exists");
			List<Address> companyAddresses = addressService
					.findAddressesByCompany(companyService.findCompanyByUser(users));
			List<Address> addressesOfCompanyForm = formCompany.getAddresses();
		
			logger.info("List from DB" + companyAddresses + "size: " + companyAddresses.size() );
			logger.info("List from FORM" + addressesOfCompanyForm + "size: " + addressesOfCompanyForm.size());
			// Check after ID if address already exists in DB
			for (Address addressFromForm : addressesOfCompanyForm) {	
				logger.info("searching in loop 1: " + addressFromForm.getId());
				if(addressFromForm.getId() == null){
					logger.info("address with id == null");
					addressFromForm.setCompany(companyService.findCompanyByUser(users));
					addressService.saveOrUpdate(addressFromForm);
					//addressesOfCompanyForm.remove(addressFromForm);
					// Is is good solution ? should I remove object from list ? 
				}
				
				for (Address addressOfCompany : companyAddresses) {
					logger.info("searching in loop 2: " + addressOfCompany.getId());
					logger.info("searching in loop 2 for entity id from loop1: " + addressFromForm.getId());

					if (addressFromForm.getId() == (addressOfCompany.getId())) {
						Address existingCompanyAddress = addressService.findById(addressFromForm.getId());
						existingCompanyAddress.setStreet(addressFromForm.getStreet());
						existingCompanyAddress.setStreetNumber(addressFromForm.getStreetNumber());
						existingCompanyAddress.setZipcode(addressFromForm.getZipcode());
						existingCompanyAddress.setCity(addressFromForm.getCity());
						addressService.saveOrUpdate(existingCompanyAddress);

					}
				}

			}
		}

		if (addressService.findAddressesByCompany(companyService.findCompanyByUser(users)).isEmpty()) {
			logger.info("Address list does not exists - save all list from form");
			List<Address> addressesOfCompanyForm = formCompany.getAddresses();
			for (Address address : addressesOfCompanyForm) {
				address.setCompany(companyService.findCompanyByUser(users));
				addressService.saveAndFlush(address);
			}

		}

		if (result.hasErrors()) {
			return "/user-settings/edit-company";
		} else {
			redirectAttributes.addFlashAttribute("msg", "Changes updated");
			redirectAttributes.addFlashAttribute("formCompany", formCompany);
			// redirectAttributes.addFlashAttribute("addressesList",
			// companyService.findAddressesByCompany(companyInList));
		}

		return "redirect:/user-settings/edit-company.html";
	}

	/*@RequestMapping("/user-settings/edit-company/company-details")
	public String companyDetails(Model model, Principal principal) {

		String name = principal.getName();
		User currentUser = userService.findUser(name);

		List<User> users = new ArrayList<User>();
		users.add(currentUser);

		Company userCompany = companyService.findCompanyByUser(users);

		model.addAttribute("companyDB", companyService.findCompanyByUser(users));
		model.addAttribute("companyAddressessDB", addressService.findAddressesByCompany(userCompany));
		return "company-details";
	}*/

	@RequestMapping("/user-settings/edit-company")
	public String settCompanyDetails(Model model, Principal principal) {
		String name = principal.getName();

		logger.debug("show edit company - get");

		User currentUser = userService.findUser(name);

		List<User> users = new ArrayList<User>();
		users.add(currentUser);

		Company userCompany = companyService.findCompanyByUser(users);

		model.addAttribute("companyDB", companyService.findCompanyByUser(users));
		model.addAttribute("companyAddressessDB", addressService.findAddressesByCompany(userCompany));
		model.addAttribute("user", userService.findUser(name));
		return "edit-company";
	}

}

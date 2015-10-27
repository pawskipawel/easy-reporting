package com.paxxa.ers.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.service.AddresService;
import com.paxxa.ers.service.CompanyService;
import com.paxxa.ers.service.UserService;

@Transactional
@Controller
public class UserEditCompanyController {

	@Autowired
	UserService userService;
	@Autowired
	CompanyService companyService;
	@Autowired
	AddresService addressService;

	@ModelAttribute("company")
	public Company initCompany(){
		return new Company();
	}

	

	@RequestMapping("/user-settings/edit-company")
	public String settCompanyDetails(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("user", userService.findUser(name));
		return "edit-company";
	}

	@Transactional
	@RequestMapping(value = "/user-settings/edit-company", method = RequestMethod.POST)
	public String doEditCompany(@ModelAttribute("company") Company formCompany, Model model,
			Principal principal, BindingResult result, final RedirectAttributes redirectAttributes) {
		String name = principal.getName();
		User currentUser = userService.findUser(name);

		List<User> users = new ArrayList<User>();
		users.add(currentUser);

		// Company entity
		if (companyService.findCompanyByUser(users) != null) {
			Company existingCompany = companyService.findCompanyByUser(users);
			existingCompany.setCompanyName(formCompany.getCompanyName());
			existingCompany.setNip(formCompany.getNip());
			companyService.saveAndFlush(existingCompany);
			userService.saveAndFlush(currentUser);
		}
		if (companyService.findCompanyByUser(users) == null) {
			formCompany.setUsers(users);
			companyService.create(formCompany);
			currentUser.setCompany(formCompany);
			userService.saveAndFlush(currentUser);
		}
		
		System.out.println(formCompany.getAddresses().isEmpty());
		System.out.println(formCompany.getAddresses().size());
		System.out.println(formCompany.getAddresses());
		
		
		// Address entity
		List<Company> companyInList = new ArrayList<Company>();
		companyInList.add(companyService.findCompanyByUser(users));
		/*if (addressService.findAddressByCompany(companyInList) != null) {
			Address addressOfCompany = addressService.findAddressByCompany(companyInList);
			addressOfCompany.setStreet(formAddress.getStreet());
			addressOfCompany.setStreetNumber(formAddress.getStreetNumber());
			addressOfCompany.setZipcode(formAddress.getZipcode());
			addressOfCompany.setCity(formAddress.getCity());
			addressOfCompany.setCompanys(companyService.findCompanyByUser(users));
			addressService.saveAndFlush(addressOfCompany);
			
			
		}*/

		/*if (addressService.findAddressByCompany(companyInList) == null) {
			formAddress.setCompanys(formCompany);
			addressService.saveAndFlush(formAddress);
		}*/

		if (result.hasErrors()){
			return "/user-settings/edit-company";
		}
		else {
			redirectAttributes.addFlashAttribute("msg", "Changes updated");
			redirectAttributes.addFlashAttribute("formCompany", formCompany);
			//redirectAttributes.addFlashAttribute("addressesList", companyService.findAddressesByCompany(companyInList));
		}
		
		return "redirect:/user-settings/edit-company/company-details.html";
	}
	
	@RequestMapping("/user-settings/edit-company/company-details")
	public String companyDetails(Model model, Principal principal) {
		
		String name = principal.getName();
		User currentUser = userService.findUser(name);

		List<User> users = new ArrayList<User>();
		users.add(currentUser);
		
		Company userCompany = companyService.findCompanyByUser(users);
		
		model.addAttribute("companyDB", companyService.findCompanyByUser(users));
		model.addAttribute("companyAddressessDB", addressService.findAddressesByCompany(userCompany));
		return "company-details";
	}

}

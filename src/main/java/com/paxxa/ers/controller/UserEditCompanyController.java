package com.paxxa.ers.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.BankAccount;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.service.AddresService;
import com.paxxa.ers.service.BankAccountService;
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
	@Autowired
	BankAccountService bankAccountService;

	@ModelAttribute("company")
	public Company initCompany() {
		return new Company();
	}

	@RequestMapping("/user-settings/edit-company")
	public String settCompanyDetails(Model model, Principal principal) {
		logger.debug("show edit company - get");

		String name = principal.getName();
		User currentUser = userService.findUser(name);
		List<User> users = new ArrayList<User>();
		users.add(currentUser);
		Company userCompany = companyService.findCompanyByUser(users);

		model.addAttribute("companyDB", companyService.findCompanyByUser(users));
		model.addAttribute("companyAddressessDB", addressService.findByCompanyNotDeletedAddresses(userCompany));
		model.addAttribute("companyBankAccountsDb", bankAccountService.findByCompanyNotDeletedBankAccounts(userCompany));
		model.addAttribute("user", userService.findUser(name));
		return "edit-company";
	}

	@Transactional
	@RequestMapping(value = "/user-settings/edit-company", method = RequestMethod.POST)
	public String doEditCompany(@ModelAttribute("company") Company formCompany,
			@RequestParam(value = "addressesToDelete[]", required = false) List<String> addressesToDeleteList,
			@RequestParam(value = "defaultInvoiceAddress", required = false) String addressIdAsDefault, Model model,
			Principal principal, BindingResult result, final RedirectAttributes redirectAttributes) {
		String name = principal.getName();
		User currentUser = userService.findUser(name);
		List<User> users = new ArrayList<User>();
		users.add(currentUser);

		logger.info("edit company - post");

		/*
		 * Block responsible for setting status "default address for invoice"
		 */
		logger.info("default status for ID " + addressIdAsDefault);

		/*
		 * List of addresses ID's to delete / remove
		 */
		if (addressesToDeleteList != null) {
			for (String id : addressesToDeleteList) {
				if (id != null && id != "") {
					logger.info("@RequestParam " + id);
					Address existingAddressToDelete = addressService.findById(Integer.parseInt(id));
					existingAddressToDelete.setIsDeleted(true);
					addressService.saveOrUpdate(existingAddressToDelete);
				}
			}
		}

		/*
		 * Part responsible for saving and updating base Company entity
		 * attributes (without references)
		 */
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
		/*
		 * Part responsible for updating List of Addresses for Company entity
		 */
		List<Company> companyInList = new ArrayList<Company>();
		companyInList.add(companyService.findCompanyByUser(users));
		if (!addressService.findAddressesByCompany(companyService.findCompanyByUser(users)).isEmpty()) {

			logger.info("Address list exists");
			List<Address> companyAddresses = addressService
					.findAddressesByCompany(companyService.findCompanyByUser(users));
			List<Address> addressesOfCompanyForm = formCompany.getAddresses();

			logger.info("List from DB" + companyAddresses + "size: " + companyAddresses.size());
			logger.info("List from FORM" + addressesOfCompanyForm + "size: " + addressesOfCompanyForm.size());
			// Check after ID if address already exists in DB
			for (Address addressFromForm : addressesOfCompanyForm) {
				logger.info("searching in loop 1: " + addressFromForm.getId());

				/*
				 * block for saving dynamically added addresses (they do not
				 * contain ID) and prevention of saving into DB an empty
				 * entities created after dynamically removing not-last object
				 * form list (reason is not updated incrementation)
				 */
				if (addressFromForm.getId() == null && addressFromForm.getCity() != null
						&& addressFromForm.getStreet() != null) {
					logger.info("address with id == null");
					addressFromForm.setCompany(companyService.findCompanyByUser(users));
					addressService.saveOrUpdate(addressFromForm);
					// addressesOfCompanyForm.remove(addressFromForm);
					// Is is good solution ? should I remove object from
					// list ?
				}

				for (Address addressOfCompany : companyAddresses) {
					logger.info("searching in loop 2: " + addressOfCompany.getId());
					logger.info("searching in loop 2 for entity id from loop1: " + addressFromForm.getId());

					if (addressFromForm.getId() == (addressOfCompany.getId())) {
						Address existingCompanyAddress = addressService.findById(addressFromForm.getId());

						/*
						 * Saving address passed by form with new ID, only when
						 * there was modification. For the address from Db which
						 * was base for the modification, set isDeleted with
						 * true.
						 */
						if (!existingCompanyAddress.getStreet().equals(addressFromForm.getStreet())
								|| !existingCompanyAddress.getStreetNumber().equals(addressFromForm.getStreetNumber())
								|| !existingCompanyAddress.getZipcode().equals(addressFromForm.getZipcode())
								|| !existingCompanyAddress.getCity().equals(addressFromForm.getCity())

						) {
							existingCompanyAddress.setIsDeleted(true);
							Address addressAfterRevision = new Address();
							addressAfterRevision.setCompany(companyService.findCompanyByUser(users));
							addressAfterRevision.setStreet(addressFromForm.getStreet());
							addressAfterRevision.setStreetNumber(addressFromForm.getStreetNumber());
							addressAfterRevision.setZipcode(addressFromForm.getZipcode());
							addressAfterRevision.setCity(addressFromForm.getCity());
							addressService.saveOrUpdate(addressAfterRevision);
						}
						addressService.saveOrUpdate(existingCompanyAddress);
					}
				}
			}
		}

		/*
		 * Block responsible for initial data saving in DB, with condition for
		 * no addresses for company block save all addresses list without cases
		 * where address is empty (empty address entity is passed when
		 * dynamically in view addresses are added and removed not from the last
		 * one on list - which lead to incorrect incrementation
		 */
		if (addressService.findAddressesByCompany(companyService.findCompanyByUser(users)).isEmpty()) {
			logger.info("Address list does not exists - save all list from form");
			List<Address> addressesOfCompanyForm = formCompany.getAddresses();
			for (Address address : addressesOfCompanyForm) {
				if (address.getCity() != null && address.getStreet() != null) {
					address.setRevisionDate(new Date());
					address.setRevisionNumber(0);
					address.setCompany(companyService.findCompanyByUser(users));
					addressService.saveAndFlush(address);
				}
			}

		}

		/*
		 * Bloc responsible for setting IsDefaultInvoiceAddress status
		 */
		if (addressIdAsDefault != null) {
			Address currentDbAddressAsDefaultInvoice = addressService
					.findCurrentAddressAsDefaultInvoice(companyService.findCompanyByUser(users));
			Address newDbAddessAsDefaultInvoice = addressService.findById(Integer.parseInt(addressIdAsDefault));
			if (currentDbAddressAsDefaultInvoice != null) {
				logger.info("Setting IsDefaultInvoiceAddress status:  currentDbAddress ID: "
						+ currentDbAddressAsDefaultInvoice.getId());
			}
			logger.info(
					"Setting IsDefaultInvoiceAddress status:  new Address ID: " + newDbAddessAsDefaultInvoice.getId());
			if (currentDbAddressAsDefaultInvoice != null
					&& Integer.parseInt(addressIdAsDefault) != currentDbAddressAsDefaultInvoice.getId()) {
				currentDbAddressAsDefaultInvoice.setIsDefaultInvoiceAddress(false);
				newDbAddessAsDefaultInvoice.setIsDefaultInvoiceAddress(true);
				addressService.saveAndFlush(currentDbAddressAsDefaultInvoice);
				addressService.saveAndFlush(newDbAddessAsDefaultInvoice);
			}
			if (currentDbAddressAsDefaultInvoice != null
					&& Integer.parseInt(addressIdAsDefault) == currentDbAddressAsDefaultInvoice.getId()) {
				// do nothing
			} else {
				newDbAddessAsDefaultInvoice.setIsDefaultInvoiceAddress(true);
				addressService.saveAndFlush(newDbAddessAsDefaultInvoice);

			}
		}
		
		// Bank account 
		
		if(bankAccountService.findBankAccountsByCompany(companyService.findCompanyByUser(users)).isEmpty()){
			logger.info("Bank account list does not exists - save all list from form");
			List<BankAccount> bankAccountsOfCompanyForm = formCompany.getBankAccount();
			for (BankAccount bankAccount : bankAccountsOfCompanyForm){
				if(bankAccount.getAccountNumber() != null){
					logger.info("Inside loop: account number is : " + bankAccount.getAccountNumber());
					bankAccount.setCompany(companyService.findCompanyByUser(users));
					bankAccountService.saveAndFlush(bankAccount);
				}
				
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

		return "redirect:/user-settings/company-details.html";
	}

	@RequestMapping("/user-settings/company-details")
	public String companyDetails(Model model, Principal principal) {
		logger.debug("show  company details");

		String name = principal.getName();
		User currentUser = userService.findUser(name);
		List<User> users = new ArrayList<User>();
		users.add(currentUser);
		Company userCompany = companyService.findCompanyByUser(users);

		model.addAttribute("companyDB", companyService.findCompanyByUser(users));
		model.addAttribute("companyAddressessDB", addressService.findByCompanyNotDeletedAddresses(userCompany));
		model.addAttribute("companyBankAccountsDb", bankAccountService.findByCompanyNotDeletedBankAccounts(userCompany));
		model.addAttribute("user", userService.findUser(name));
		return "company-details";
	}

}

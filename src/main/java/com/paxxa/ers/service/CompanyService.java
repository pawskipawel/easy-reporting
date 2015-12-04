package com.paxxa.ers.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxxa.ers.entity.Address;
import com.paxxa.ers.entity.Company;
import com.paxxa.ers.entity.User;
import com.paxxa.ers.repository.AddressRepository;
import com.paxxa.ers.repository.CompanyRepository;

@Service
@Transactional
public class CompanyService {

	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	AddressRepository addressRepository;

	
	public void create(Company company){
		companyRepository.save(company);
	}
	
	
	public void save(Company company){
		companyRepository.save(company);
	}
	
	public void saveAndFlush(Company company){
		companyRepository.save(company);
	}


	public Company findCompanyByUser(List<User> user) {
		return companyRepository.findByUsers(user);
		
	}


	public void saveOrUpdate(Company company) {
		companyRepository.save(company);
		
	}
	/*
	 * Verification if NIP number is Correct
	 * @param nip
	 * return true if correct
	 */
	
	public Boolean isNipCorrect(String nip){
		 nip = trimInput(nip);
	        int nsize = nip.length();
	        if (nsize != 10) {
	            return false;
	        }
	        int[] weights = {6,5,7,2,3,4,5,6,7};
	        int j = 0, sum = 0, control = 0;
	        int csum = new Integer(nip.substring(nsize - 1)).intValue();
	        if (csum == 0) {
	            csum = 10;
	        }
	        for (int i = 0; i < nsize - 1; i++) {
	            char c = nip.charAt(i);
	            j = new Integer(String.valueOf(c)).intValue();
	            sum += j * weights[i];
	        }
	        control = sum % 11;
	        return (control == csum);
	}
	
    
    /**
     * Verification if NIP is correct
     * @param nip
     * @return true if correct
     */
    public boolean isValidNip(long nip) {
        return isNipCorrect(new Long(nip).toString());
    }
    
    /**
     * trim all spaces and sings
     * @param input
     * @return clear string
     */
    private static String trimInput(String input) {
        return input.replaceAll("\\D*","");
    }


	

}

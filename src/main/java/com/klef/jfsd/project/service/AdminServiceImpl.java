package com.klef.jfsd.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.project.model.Admin;
import com.klef.jfsd.project.model.Citizen;
import com.klef.jfsd.project.model.Politician;
import com.klef.jfsd.project.repository.AdminRepository;
import com.klef.jfsd.project.repository.CitizenRepository;
import com.klef.jfsd.project.repository.PoliticianRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private CitizenRepository citizenRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private PoliticianRepository politicianRepository;
	
	@Override
    public List<Citizen> ViewAllCitizens() {
        return citizenRepository.findAll();
    }

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		return adminRepository.checkadminlogin(uname, pwd);
	}


	@Override
	public long citizencount() {
		return citizenRepository.count();

	}

	@Override
	public String deletecitizen(int cid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatecitizenstatus(String status, int cid) 
	{
		 citizenRepository.updateCitizenStatus(status, cid);
		 return "Citizen Status Updated Successfully!!";
	}
	@Override
	public String addpolitician(Politician p) {
		politicianRepository.save(p);
		return "Politician Added Successfully";
	}

	@Override
	public String addcitizen(Citizen c) {
		citizenRepository.save(c);
		return "Citizen Added Successfully";
	}

	@Override
	public List<Politician> ViewAllPoliticians() {
		return politicianRepository.findAll();
	}

	@Override
	public long politiciancount() {
		return politicianRepository.count();
	}

	@Override
	public String updatepoliticianstatus(String status, int pid) {
		 politicianRepository.updatePoliticianStatus(status, pid);
		 return "Politician Status Updated Successfully!!";
	}
	
}

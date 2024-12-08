package com.klef.jfsd.project.service;

import java.util.List;

import com.klef.jfsd.project.model.Admin;
import com.klef.jfsd.project.model.Citizen;
import com.klef.jfsd.project.model.Politician;

public interface AdminService 
{
	public List<Citizen> ViewAllCitizens();
	public List<Politician> ViewAllPoliticians();
	public Admin checkadminlogin(String uname, String pwd);
	public long citizencount();
	public long politiciancount();
	public String deletecitizen(int cid);
	public String updatecitizenstatus(String status, int cid);
	public String updatepoliticianstatus(String status, int pid);
	
	public String addcitizen(Citizen c);
	public String addpolitician(Politician p);
}

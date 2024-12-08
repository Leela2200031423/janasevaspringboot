package com.klef.jfsd.project.service;

import java.util.List;

import com.klef.jfsd.project.model.Citizen;
import com.klef.jfsd.project.model.Feedback;
import com.klef.jfsd.project.model.Report;
import com.klef.jfsd.project.model.Schemes;

public interface CitizenSevice 
{
	public String CitizenRegistration(Citizen citizen);
	public Citizen checkcitizenlogin(String cemail, String cpwd);
	public String updateCitizenProfile(Citizen citizen);
	public Citizen displaycitizenID(int cid);
	public String AddReport(Report report);
	List<Report> getReportsByCitizenId(int citizenId);
	long countCitizenReports(int citizenId);
	public String AddFeedback(Feedback feedback);
	public List<Schemes> viewAllSchemesByCitizen();
//    public Schemes ViewSchemesByIDCitizen(int schemesid);
//    public String updateschemesstatus(String status, int sid);
}

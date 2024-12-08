package com.klef.jfsd.project.service;

import java.util.List;

import com.klef.jfsd.project.model.Feedback;
import com.klef.jfsd.project.model.Politician;
import com.klef.jfsd.project.model.Report;
import com.klef.jfsd.project.model.Schemes;

public interface PoliticianService {
	public Politician checkpoliticianlogin(String pemail, String ppwd);
	public String updatePoliticianProfile(Politician politician);
	public List<Report> ViewAllReports();
	public Report ViewReportByID(int reportid);
	public String updatereportstatus(String status, int rid);
	List<Report> ViewReportsByConstituency(String city);
	public long countTotalReports(String city);
    public long countReportsByStatus(String city, String status);
    public Politician displaypoliticianID(int pid);
    List<Feedback> ViewFeedbacksByConstituency(String constituency);
    public String AddPolitician(Schemes schemes);
    public List<Schemes> viewAllSchemes();
    public Schemes ViewSchemesByID(int productid);
    

}

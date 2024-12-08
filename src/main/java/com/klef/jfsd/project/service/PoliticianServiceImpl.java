package com.klef.jfsd.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.project.model.Feedback;
import com.klef.jfsd.project.model.Politician;
import com.klef.jfsd.project.model.Report;
import com.klef.jfsd.project.model.Schemes;
import com.klef.jfsd.project.repository.FeedRepoository;
import com.klef.jfsd.project.repository.PoliticianRepository;
import com.klef.jfsd.project.repository.ReportRepository;
import com.klef.jfsd.project.repository.SchemesRepository;
@Service
public class PoliticianServiceImpl implements PoliticianService
{
	@Autowired
	private PoliticianRepository politicianRepository;
	
	@Autowired
	private ReportRepository reportRepository;
	
	@Autowired
    private FeedRepoository feedbackRepository;
	
	@Autowired
	private SchemesRepository schemesRepository;
	
	@Override
	public Politician checkpoliticianlogin(String pemail, String ppwd ) {
		return politicianRepository.checkpoliticianlogin(pemail, ppwd);	}

	@Override
	public List<Report> ViewAllReports() {
		return (List<Report>) reportRepository.findAll();
	}

	@Override
	public Report ViewReportByID(int reportid) {
		return reportRepository.findById(reportid).get();
	}

	@Override
	public String updatereportstatus(String status, int rid) {
		reportRepository.updateReportStatus(status, rid);
		 return "Report Status Updated Successfully!!";
	}
	
	@Override
	public List<Report> ViewReportsByConstituency(String city) {
	    return reportRepository.findByCity(city);
	}

	@Override
    public long countTotalReports(String city) {
        return reportRepository.countByCity(city);
    }

    @Override
    public long countReportsByStatus(String city, String status) {
        return reportRepository.countByCityAndStatus(city, status);
    }

    @Override
    public String updatePoliticianProfile(Politician politician) {
        // Fetch the existing politician by ID
        Politician existingPolitician = politicianRepository.findById(politician.getId())
                .orElseThrow(() -> new RuntimeException("Politician not found"));

        // Only update allowed fields
        existingPolitician.setName(politician.getName());
        existingPolitician.setContact(politician.getContact());
        existingPolitician.setEmail(politician.getEmail());
        existingPolitician.setPassword(politician.getPassword());
        existingPolitician.setConstituency(politician.getConstituency());
        existingPolitician.setCategory(politician.getCategory());
        existingPolitician.setParty(politician.getParty());

        // Save the updated politician information back to the database
        politicianRepository.save(existingPolitician);

        return "Politician Updated Successfully";
    }

	@Override
	public Politician displaypoliticianID(int pid) {
		// TODO Auto-generated method stub
		return politicianRepository.findById(pid).get();
	}
	
	@Override
    public List<Feedback> ViewFeedbacksByConstituency(String constituency) {
        return feedbackRepository.findByConstituency(constituency);
    }

	@Override
	public String AddPolitician(Schemes schemes) {
		schemesRepository.save(schemes);
		return "Schemes Added Successfully";
	}

	@Override
	public List<Schemes> viewAllSchemes() {
		return (List<Schemes>) schemesRepository.findAll();
	}

	@Override
	public Schemes ViewSchemesByID(int schemesid) {
		// TODO Auto-generated method stub
		return schemesRepository.findById(schemesid).get();
	}
	
	


}

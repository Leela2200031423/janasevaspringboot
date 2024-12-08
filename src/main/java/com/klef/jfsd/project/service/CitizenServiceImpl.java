package com.klef.jfsd.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.project.model.Citizen;
import com.klef.jfsd.project.model.Feedback;
import com.klef.jfsd.project.model.Report;
import com.klef.jfsd.project.model.Schemes;
import com.klef.jfsd.project.repository.CitizenRepository;
import com.klef.jfsd.project.repository.FeedRepoository;
import com.klef.jfsd.project.repository.ReportRepository;
import com.klef.jfsd.project.repository.SchemesRepository;
@Service
public class CitizenServiceImpl implements CitizenSevice
{
	@Autowired
	private CitizenRepository citizenRepository;
	
	@Autowired
	private ReportRepository reportRepository;
	
	@Autowired
	private FeedRepoository feedRepoository;
	
	@Autowired
	private SchemesRepository schemesRepository;

	@Override
	public String CitizenRegistration(Citizen citizen) {
		citizenRepository.save(citizen);
		return "Citizen Registered Successfully";
	}

	@Override
	public Citizen checkcitizenlogin(String cemail, String cpwd) {
		return citizenRepository.checkcitizenlogin(cemail, cpwd);
	}

	@Override
	public String updateCitizenProfile(Citizen citizen) {
		  Citizen existingCitizen = citizenRepository.findById(citizen.getId())
		            .orElseThrow(() -> new RuntimeException("Citizen not found"));

		        // Only update allowed fields
		        existingCitizen.setName(citizen.getName());
		        existingCitizen.setContact(citizen.getContact());
		        existingCitizen.setEmail(citizen.getEmail());
		        existingCitizen.setPassword(citizen.getPassword());

		        // Save the updated citizen information back to the database
		        citizenRepository.save(existingCitizen);
		        return "Citizen Updated Successfully";
	}


	@Override
	public String AddReport(Report report) {
		reportRepository.save(report);
		return "Report Added Successfully";
	}

	@Override
	public Citizen displaycitizenID(int cid) {
		return citizenRepository.findById(cid).get();
	}
	
	@Override
    public List<Report> getReportsByCitizenId(int citizenId) {
        return reportRepository.findAllByCitizenId(citizenId);
    }
	
	@Override
	public long countCitizenReports(int citizenId) {
	    return reportRepository.countReportsByCitizenId(citizenId);
	}

	@Override
	public String AddFeedback(Feedback feedback) {
		try {
			feedRepoository.save(feedback);
	        return "Feedback submitted successfully!";
	    } catch (Exception e) {
	        return "Failed to submit feedback. " + e.getMessage();
	    }
	}
	
	@Override
	public List<Schemes> viewAllSchemesByCitizen() {
		return (List<Schemes>) schemesRepository.findAll();
	}

//	@Override
//	public Schemes ViewSchemesByIDCitizen(int schemesid) {
//		// TODO Auto-generated method stub
//		return schemesRepository.findById(schemesid).get();
//	}
//	
//	public String updateschemesstatus(String status, int rid) {
//		schemesRepository.updateSchemesStatus(status, rid);
//		 return "Scheme Applied Successfully!!";
//	}
	
	

}

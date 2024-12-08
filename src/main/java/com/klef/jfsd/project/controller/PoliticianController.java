package com.klef.jfsd.project.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.project.model.Feedback;
import com.klef.jfsd.project.model.Politician;
import com.klef.jfsd.project.model.Report;
import com.klef.jfsd.project.model.Schemes;
import com.klef.jfsd.project.service.PoliticianService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PoliticianController 
{
	@Autowired
	private PoliticianService politicianService;
	
	@GetMapping("politicianlogin")
	public ModelAndView politicianlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("politicianlogin");
		return mv;
	}
	
	@PostMapping("checkpoliticianlogin")
	//@ResponseBody
	public ModelAndView checkpoliticianlogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    String pemail = request.getParameter("pemail");
	    String ppwd = request.getParameter("ppwd");

	    Politician poli = politicianService.checkpoliticianlogin(pemail, ppwd);
	    if (poli != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("politician", poli);

	        String constituency = poli.getConstituency();

	        // Fetch report counts
	        long totalReports = politicianService.countTotalReports(constituency);
	        long takenCareReports = politicianService.countReportsByStatus(constituency, "Accepted");
	        long pendingReports = totalReports - takenCareReports;

	        mv.setViewName("politicianhome");
	        mv.addObject("totalReports", totalReports);
	        mv.addObject("takenCareReports", takenCareReports);
	        mv.addObject("pendingReports", pendingReports);
	    } else {
	        mv.setViewName("politicianlogin");
	        mv.addObject("message", "Login Failed");
	    }

	    return mv;
	}

	
	@GetMapping("politicianhome")
	public ModelAndView politicianhome(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Politician politician = (Politician) session.getAttribute("politician");

	    if (politician == null) {
	        return new ModelAndView("politiciansessionexpiry");
	    }

	    String constituency = politician.getConstituency();

	    long totalReports = politicianService.countTotalReports(constituency);
	    long takenCareReports = politicianService.countReportsByStatus(constituency, "Accepted");
	    long pendingReports = totalReports - takenCareReports;

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("politicianhome");
	    mv.addObject("totalReports", totalReports);
	    mv.addObject("takenCareReports", takenCareReports);
	    mv.addObject("pendingReports", pendingReports);

	    return mv;
	}


	
	@GetMapping("politicianlogout")
	public ModelAndView politicianlogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		session.removeAttribute("politician");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("politicianlogin");
		return mv;
	}
	
	
	@GetMapping("politiciansessionexpiry")
	public ModelAndView politiciansessionexpiry(HttpServletRequest request)
	{	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("politiciansessionexpiry");
		return mv;
	}
	@GetMapping("politicianprofile")
	public ModelAndView politicianprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("politicianprofile");
		return mv;
	}
	
	@GetMapping("viewallreports")
	public ModelAndView viewallreports(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Politician politician = (Politician) session.getAttribute("politician");
	    
	    if (politician == null) {
	        return new ModelAndView("politiciansessionexpiry");
	    }
	    
	    String constituency = politician.getConstituency();
	    List<Report> reportlist = politicianService.ViewReportsByConstituency(constituency);
	    
	    ModelAndView mv = new ModelAndView("viewallreports");
	    mv.addObject("reportlist", reportlist);
	    return mv;
	}


	   
	@GetMapping("displayreportpdf")
	public ResponseEntity<byte[]> displayprodpdfdemo(@RequestParam int id) throws Exception {
	    Report report = politicianService.ViewReportByID(id);
	    byte[] pdfBytes = null;
	    pdfBytes = report.getPdf().getBytes(1, (int) report.getPdf().length());

	    return ResponseEntity.ok()
	                         .contentType(MediaType.APPLICATION_PDF)
	                         .body(pdfBytes);
	    // Response Body, HTTP Status Code, Headers
	}
	
	@GetMapping("updatereportstatus")
    public ModelAndView updatereportstatus()
    {
      ModelAndView mv = new ModelAndView();
      List<Report> reportlist = politicianService.ViewAllReports();
      mv.setViewName("updatereportstatus");
      mv.addObject("reportlist",reportlist);
      return mv;
    }
	
	@GetMapping("updaterstatus")
	public String updaterstatus(@RequestParam("id") int rid, @RequestParam("status") String status)
	{
		politicianService.updatereportstatus(status, rid);
		return "redirect:/viewallreports";
	}
	
	@PostMapping("updatepoliticianprofile")
    public ModelAndView updatepoliticianprofile(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String msg;

        try {
            // Get updated data from request
            int id = Integer.parseInt(request.getParameter("pid"));
            String name = request.getParameter("pname");
            String email = request.getParameter("pemail");
            String password = request.getParameter("ppwd");
            String contact = request.getParameter("pcontact");
            String constituency = request.getParameter("pconstituency");
            String category = request.getParameter("pcategory");
            String party = request.getParameter("pparty");
            String status = request.getParameter("pstatus");

            // Create a Politician object and set its fields
            Politician politician = new Politician();
            politician.setId(id);
            politician.setName(name);
            politician.setEmail(email);
            politician.setPassword(password);
            politician.setContact(contact);
            politician.setConstituency(constituency);
            politician.setCategory(category);
            politician.setParty(party);
            politician.setStatus(status);

            // Update profile
            msg = politicianService.updatePoliticianProfile(politician);

            // Reload updated politician and refresh session
            Politician updatedPolitician = politicianService.displaypoliticianID(id);
            HttpSession session = request.getSession();
            session.setAttribute("politician", updatedPolitician);

            mv.addObject("messageType", "success");
        } catch (Exception e) {
            msg = "Profile update failed. " + e.getMessage();
            mv.addObject("messageType", "error");
        }

        mv.addObject("message", msg);
        mv.setViewName("politicianprofile");
        return mv;
    }
	
	@GetMapping("updatepoliticianprofile")
    public ModelAndView updatepoliticianprofile() {
        return new ModelAndView("updatepoliticianprofile");
    }
	
	@GetMapping("viewallfeedbacks")
	public ModelAndView viewAllFeedbacks(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Politician politician = (Politician) session.getAttribute("politician");

	    if (politician == null) {
	        return new ModelAndView("politiciansessionexpiry");
	    }

	    String constituency = politician.getConstituency();
	    List<Feedback> feedbackList = politicianService.ViewFeedbacksByConstituency(constituency);

	    ModelAndView mv = new ModelAndView("viewallfeedbacks");
	    mv.addObject("feedbackList", feedbackList);
	    return mv;
	}
	
	@GetMapping("addschemes")
    public ModelAndView addschemes(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Politician politician = (Politician) session.getAttribute("politician");

        ModelAndView mv = new ModelAndView();

        if (politician != null) {
            mv.setViewName("addschemes");
        } else {
            mv.setViewName("politicianlogin");
            mv.addObject("message", "Please log in to submit a new scheme.");
            mv.addObject("messageType", "error");
        }

        return mv;
    }

    @PostMapping("insertschemes")
    public ModelAndView insertschemes(HttpServletRequest request, @RequestParam("schemesimage") MultipartFile file) throws Exception {
        String msg;
        ModelAndView mv = new ModelAndView("addschemes");
        HttpSession session = request.getSession();
        Politician politician = (Politician) session.getAttribute("politician");

        if (politician == null) {
            mv.setViewName("politicianlogin");
            mv.addObject("message", "Please log in to submit a new scheme.");
            mv.addObject("messageType", "error");
            return mv;
        }

        try {
            

            // Extracting form fields
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String eligibility = request.getParameter("eligibility");
            String benifits = request.getParameter("benifits");
            String date = request.getParameter("date");

            // Convert file to Blob
            byte[] bytes = file.getBytes();
            Blob Blob = new javax.sql.rowset.serial.SerialBlob(bytes);
            
            String status = "Pending";

            // Create and set scheme object
            Schemes s = new Schemes();
            s.setTitle(title);
            s.setDescription(description);
            s.setEligibility(eligibility);
            s.setBenifits(benifits);
            s.setDate(date);
            s.setImage(Blob);  // Set PDF as image field for storage
            s.setStatus(status);

            // Save scheme
            msg = politicianService.AddPolitician(s);
            mv.addObject("message", msg);
            mv.addObject("messageType", "success");

        } catch (Exception e) {
            msg = "Scheme submission failed. " + e.getMessage();
            mv.addObject("message", msg);
            mv.addObject("messageType", "error");
        }

        return mv;
    }
    
    @GetMapping("viewallschemes")
    public ModelAndView viewallschemes()
    {
    	List<Schemes> schemeslist = politicianService.viewAllSchemes();
    	ModelAndView mv = new ModelAndView("viewallschemes");
    	mv.addObject("schemeslist", schemeslist);
    	
    	return mv;
    }
    
    @GetMapping("displayprodimage")
    public ResponseEntity<byte[]> displayprodimagedemo(@RequestParam int id) throws Exception
    {
      Schemes schemes =  politicianService.ViewSchemesByID(id);
      byte [] imageBytes = null;
      imageBytes = schemes.getImage().getBytes(1,(int) schemes.getImage().length());

      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
      
    // Response Body, HTTP Status Code, Headers
    }
    

    

}
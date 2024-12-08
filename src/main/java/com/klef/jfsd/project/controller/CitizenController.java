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

import com.klef.jfsd.project.model.Citizen;
import com.klef.jfsd.project.model.Feedback;
import com.klef.jfsd.project.model.Report;
import com.klef.jfsd.project.model.Schemes;
import com.klef.jfsd.project.service.CitizenSevice;
import com.klef.jfsd.project.service.PoliticianService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CitizenController {

    @Autowired 
    private CitizenSevice citizenSevice;
    
    @Autowired 
    private PoliticianService politicianService;

    @GetMapping("/")
    public ModelAndView home() {
        return new ModelAndView("home");
    }

    @GetMapping("citizenreg")
    public ModelAndView citizenreg() {
        return new ModelAndView("citizenreg");
    }

    @GetMapping("citizenlogin")
    public ModelAndView citizenlogin() {
        return new ModelAndView("citizenlogin");
    }
    @GetMapping("reporthome")
    public ModelAndView reporthome(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");

        ModelAndView mv = new ModelAndView();

        if (citizen != null) {
            // Fetch the count of reports submitted by the citizen
            long reportCount = citizenSevice.countCitizenReports(citizen.getId());

            mv.setViewName("reporthome");
            mv.addObject("reportCount", reportCount); // Add the report count to the model
        } else {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Please log in to access the report home.");
            mv.addObject("messageType", "error");
        }

        return mv;
    }

    

    @PostMapping("insertcitizen")
    public ModelAndView insertcitizen(HttpServletRequest request) {
        String name = request.getParameter("cname");
        String gender = request.getParameter("cgender");
        String dateofbirth = request.getParameter("cdob");
        String email = request.getParameter("cemail");
        String password = request.getParameter("cpwd");
        String aadhaarnumber = request.getParameter("caadhaarno");
        String contact = request.getParameter("ccontact");
        String status = "Registered";

        Citizen citizen = new Citizen();
        citizen.setName(name);
        citizen.setGender(gender);
        citizen.setDataofbirth(dateofbirth);
        citizen.setEmail(email);
        citizen.setPassword(password);
        citizen.setContact(contact);
        citizen.setAadhaarnumber(aadhaarnumber);
        citizen.setStatus(status);

        String msg = citizenSevice.CitizenRegistration(citizen);

        ModelAndView mv = new ModelAndView("citizenreg");
        mv.addObject("message", msg);
        mv.addObject("messageType", msg.contains("success") ? "success" : "error");
        return mv;
    }

    @PostMapping("checkcitizenlogin")
    public ModelAndView checkcitizenlogin(HttpServletRequest request) {
        String cemail = request.getParameter("cemail");
        String cpwd = request.getParameter("cpwd");

        Citizen cit = citizenSevice.checkcitizenlogin(cemail, cpwd);
        ModelAndView mv = new ModelAndView();

        if (cit != null) {
            HttpSession session = request.getSession();
            session.setAttribute("citizen", cit);

            // Fetch the report count for the citizen
            long reportCount = citizenSevice.countCitizenReports(cit.getId());


            mv.setViewName("citizenhome");
            mv.addObject("reportCount", reportCount); // Add the report count to the model
           
        } else {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Login Failed");
            mv.addObject("messageType", "error");
        }

        return mv;
    }


    @GetMapping("citizenhome")
    public ModelAndView citizenhome(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");

        ModelAndView mv = new ModelAndView();
        if (citizen != null) {
            long reportCount = citizenSevice.countCitizenReports(citizen.getId());

            mv.setViewName("citizenhome");
            mv.addObject("reportCount", reportCount);
        } else {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Session expired. Please log in again.");
            mv.addObject("messageType", "error");
        }

        return mv;
    }

    @GetMapping("citizenlogout")
    public ModelAndView citizenlogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("citizen");
        return new ModelAndView("citizenlogin");
    }

    @GetMapping("citizenprofile")
    public ModelAndView citizenprofile() {
        return new ModelAndView("citizenprofile");
    }

    @GetMapping("citizencontactus")
    public ModelAndView citizencontactus() {
        return new ModelAndView("citizencontactus");
    }

    @GetMapping("citizensessionexpiry")
    public ModelAndView citizensessionexpiry() {
        return new ModelAndView("citizensessionexpiry");
    }

    @GetMapping("addreport")
    public ModelAndView addreport(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");

        ModelAndView mv = new ModelAndView();

        if (citizen != null) {
            // Fetch the count of reports submitted by the citizen
            long reportCount = citizenSevice.countCitizenReports(citizen.getId());

            mv.setViewName("addreport");
            mv.addObject("reportCount", reportCount); // Add the report count to the model
        } else {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Please log in to submit a new report.");
            mv.addObject("messageType", "error");
        }

        return mv;
    }

	@PostMapping("insertreport")
	public ModelAndView insertreport(HttpServletRequest request, @RequestParam("reportpdf") MultipartFile file) throws Exception {
	    String msg;
	    ModelAndView mv = new ModelAndView("addreport");
	    HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");

        if (citizen == null) {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Session expired. Please log in again.");
            mv.addObject("messageType", "error");
            return mv;
        }
	    try {
	    	
	        String title = request.getParameter("title");
	        String city = request.getParameter("city");
	        String location = request.getParameter("location");
	        String description = request.getParameter("description");

	        byte[] bytes = file.getBytes();
	        Blob pdfBlob = new javax.sql.rowset.serial.SerialBlob(bytes);
	        
	        String status = "Pending";

	        Report r = new Report();
	        r.setTitle(title);
	        r.setCity(city);
	        r.setLocation(location);
	        r.setDescription(description);
	        r.setPdf(pdfBlob);
	        r.setCitizen(citizen);
	        r.setStatus(status);

	        msg = citizenSevice.AddReport(r);
	        mv.addObject("message", msg);
	        mv.addObject("messageType", "success");
	    } catch (Exception e) {
	        msg = "Report submission failed. " + e.getMessage();
	        mv.addObject("messageType", "error");
	    }

	    mv.addObject("message", msg);
	    return mv;
	}

    @GetMapping("updatecitizen")
    public ModelAndView updatecitizen() {
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("updatecitizen");
		return mv;
    }

    @PostMapping("updatecitizenprofile")
    public ModelAndView updatecitizenprofile(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String msg;

        try {
            // Get updated data from request
            int id = Integer.parseInt(request.getParameter("cid"));
            String name = request.getParameter("cname");
            String email = request.getParameter("cemail");
            String password = request.getParameter("cpwd");
            String contact = request.getParameter("ccontact");

            Citizen citizen = new Citizen();
            citizen.setId(id);
            citizen.setName(name);
            citizen.setEmail(email);
            citizen.setPassword(password);
            citizen.setContact(contact);

            // Update profile
            msg = citizenSevice.updateCitizenProfile(citizen);

            // Reload updated citizen and refresh session
            Citizen updatedCitizen = citizenSevice.displaycitizenID(id);
            HttpSession session = request.getSession();
            session.setAttribute("citizen", updatedCitizen);

            mv.addObject("messageType", "success");
        } catch (Exception e) {
            msg = "Profile update failed. " + e.getMessage();
            mv.addObject("messageType", "error");
        }

        mv.addObject("message", msg);
        mv.setViewName("citizenprofile");
        return mv;
    }
    
    @GetMapping("viewreports")
    public ModelAndView viewReports(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");

        ModelAndView mv = new ModelAndView();
        if (citizen != null) {
            List<Report> reports = citizenSevice.getReportsByCitizenId(citizen.getId());
            mv.setViewName("viewreports");
            mv.addObject("reports", reports);
        } else {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Please log in to view your reports.");
            mv.addObject("messageType", "error");
        }

        return mv;
    }
    
    
    @PostMapping("insertfeedback")
    public ModelAndView insertfeedback(HttpServletRequest request) {
        String citizenname = request.getParameter("cname");
        String constituency = request.getParameter("constituency");
        String issue = request.getParameter("issue");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String suggestions = request.getParameter("suggestions");

        // Ensure that the citizen's name is not NULL and is coming from the session
        HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");
        if (citizen != null) {
            citizenname = citizen.getName();  // Set the citizen's name from session
        }

        Feedback feedback = new Feedback();
        feedback.setCitizenname(citizenname);
        feedback.setConstituency(constituency);
        feedback.setIssue(issue);
        feedback.setRating(rating);
        feedback.setSuggestions(suggestions);

        String msg = citizenSevice.AddFeedback(feedback);

        ModelAndView mv = new ModelAndView("feedbackform");
        mv.addObject("message", msg);
        mv.addObject("messageType", msg.contains("success") ? "success" : "error");
        return mv;
    }


    @GetMapping("feedbackform")
    public ModelAndView feedbackform(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Citizen citizen = (Citizen) session.getAttribute("citizen");

        ModelAndView mv = new ModelAndView();

        if (citizen != null) {
            // Fetch the count of reports submitted by the citizen
            long reportCount = citizenSevice.countCitizenReports(citizen.getId());

            mv.setViewName("feedbackform");
            mv.addObject("reportCount", reportCount); // Add the report count to the model
        } else {
            mv.setViewName("citizenlogin");
            mv.addObject("message", "Please log in to submit a new report.");
            mv.addObject("messageType", "error");
        }

        return mv;
    }

    @GetMapping("updatecitizenprofile")
    public ModelAndView updatecitizenprofile() {
        return new ModelAndView("updatecitizenprofile");
    }
    
    @GetMapping("viewallschemesbycitizen")
    public ModelAndView viewallschemesbycitizen()
    {
    	List<Schemes> schemeslist = citizenSevice.viewAllSchemesByCitizen();
    	ModelAndView mv = new ModelAndView("viewallschemesbycitizen");
    	mv.addObject("schemeslist", schemeslist);
    	
    	return mv;
    }
    
//    @GetMapping("displayprodimage1")
//    public ResponseEntity<byte[]> displayprodimagedemo1(@RequestParam int id) throws Exception
//    {
//      Schemes schemes =  citizenSevice.vi(id);
//      byte [] imageBytes = null;
//      imageBytes = schemes.getImage().getBytes(1,(int) schemes.getImage().length());
//
//      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
//      
//    // Response Body, HTTP Status Code, Headers
//    }
    
//    @GetMapping("updateschemesstatus")
//    public ModelAndView updateschemesstatus()
//    {
//      ModelAndView mv = new ModelAndView();
//      List<Schemes> schmeneslist = citizenSevice.viewAllSchemesByCitizen();
//      mv.setViewName("updateschemesstatus");
//      mv.addObject("schmeneslist",schmeneslist);
//      return mv;
//    }
//	
//	@GetMapping("updatesstatus")
//	public String updaterstatus(@RequestParam("id") int sid, @RequestParam("status") String status)
//	{
//		citizenSevice.updateschemesstatus(status, sid);
//		return "redirect:/viewallschemsbycitizens";
//	}

}

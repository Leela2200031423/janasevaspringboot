package com.klef.jfsd.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.project.model.Admin;
import com.klef.jfsd.project.model.Citizen;
import com.klef.jfsd.project.model.Politician;
import com.klef.jfsd.project.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController 
{
	@Autowired
    private AdminService adminService;
	
	
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	 @GetMapping("viewallcitizens")
	    public ModelAndView viewAllCitizens() {
	        ModelAndView mv = new ModelAndView("viewallcitizens");
	        List<Citizen> citlist = adminService.ViewAllCitizens();
	        mv.addObject("citlist", citlist);

	        long count = adminService.citizencount();
	        mv.addObject("citizencount", count);

	        return mv;
	    }
	 @GetMapping("manager")
		public ModelAndView manager()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("manager");
			return mv;
		}
	
	@GetMapping("viewallpoliticians")
    public ModelAndView viewallpoliticians()
    {
      ModelAndView mv = new ModelAndView();
      List<Politician> polilist = adminService.ViewAllPoliticians();
      mv.setViewName("viewallpoliticians");
      mv.addObject("polilist",polilist);
      
      long count = adminService.politiciancount();
	  mv.addObject("politiciancount", count);
		
		
      return mv;
    }
	
	@GetMapping("deletecitizen")
    public ModelAndView deleteemp()
    {
      ModelAndView mv = new ModelAndView();
      List<Citizen> citizenlist = adminService.ViewAllCitizens();
      mv.setViewName("deleteemp");
      mv.addObject("citizenlist",citizenlist);
      return mv;
    }
	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");
		
		Admin admin = adminService.checkadminlogin(auname, apwd);
		if(admin != null)
		{
			//return "admin login success";
			mv.setViewName("adminhome"); //to redirect to other JSP page
			long count = adminService.citizencount();
			mv.addObject("citizencount", count);
			long count1 = adminService.politiciancount();
			mv.addObject("politiciancount", count1);
			
		}
		else
		{
			//return "admin login fail";
			mv.setViewName("adminloginfail");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		
		long count = adminService.citizencount();
		mv.addObject("citizencount", count);
		
		long count1 = adminService.politiciancount();
		mv.addObject("politiciancount", count1);
		
		
		return mv;
	}
	
	@GetMapping("delete")
	public String deleteoperation(@RequestParam("id") int cid)
	{
		adminService.deletecitizen(cid);
		
		return "redirect:/deletecitizen";
	}

	@GetMapping("updatecitizenstatus")
    public ModelAndView updatecitizenstatus()
    {
      ModelAndView mv = new ModelAndView();
      List<Citizen> citizenlist = adminService.ViewAllCitizens();
      mv.setViewName("updatecitizenstatus");
      mv.addObject("citizenlist",citizenlist);
      return mv;
    }
	
	@GetMapping("updatepoliticianstatus")
    public ModelAndView updatepoliticianstatus()
    {
      ModelAndView mv = new ModelAndView();
      List<Politician> polilist = adminService.ViewAllPoliticians();
      mv.setViewName("updatepoliticianstatus");
      mv.addObject("polilist",polilist);
      return mv;
    }
	
	@GetMapping("updatestatus")
	public String updatestatus(@RequestParam("id") int cid, @RequestParam("status") String status)
	{
		adminService.updatecitizenstatus(status, cid);
		return "redirect:/viewallcitizens";
	}
	@GetMapping("updatepstatus")
	public String updatepstatus(@RequestParam("id") int cid, @RequestParam("status") String status)
	{
		adminService.updatepoliticianstatus(status, cid);
		return "redirect:/viewallpoliticians";
	}
	
	@GetMapping("addpolitician")
	public String addpolitician(Model m)
	{
		m.addAttribute("politician", new Politician());
		return "addpolitician";
	}
	
	@PostMapping("insertpolitician")
	public ModelAndView insertcustomer(HttpServletRequest request)
	{
		    String name = request.getParameter("pname");
		    String gender = request.getParameter("pgender");
		    String dateofbirth = request.getParameter("pdob");
		    String email = request.getParameter("pemail");
		    String password = request.getParameter("ppwd");
		    String constituency = request.getParameter("pconstituency");
		    String category= request.getParameter("pcategory");
		    String party= request.getParameter("pparty");
		    String contact = request.getParameter("pcontact");
		    String status = "Active";
		    
		    Politician politician = new  Politician();
		      politician.setName(name);
		      politician.setGender(gender);
		      politician.setDataofbirth(dateofbirth);
		      politician.setEmail(email);
		      politician.setPassword(password);
		      politician.setConstituency(constituency);
		      politician.setCategory(category);
		      politician.setParty(party);
		      politician.setContact(contact);
		      politician.setStatus(status);
		      
		      String msg = adminService.addpolitician(politician);
		      
		      ModelAndView mv = new ModelAndView("politiciansuccess");
		      mv.addObject("message", msg);
		    
		      return mv;
		
	}
	@GetMapping("addcitizen")
	public String addcitizen(Model m)
	{
		m.addAttribute("citizen", new Citizen());
		return "addcitizen";
	}
	
	@PostMapping("insertcitizens")
	   public ModelAndView insertcitizens(HttpServletRequest request)
	   {
	      String name = request.getParameter("cname");
	    String gender = request.getParameter("cgender");
	    String dateofbirth = request.getParameter("cdob");
	    String email = request.getParameter("cemail");
	    String password = request.getParameter("cpwd");
	    String aadhaarnumber= request.getParameter("caadhaarno");
	    String contact = request.getParameter("ccontact");
	    String status = "Registered";
	    
	      Citizen citizen = new Citizen();
	      citizen.setName(name);
	      citizen.setGender(gender);
	      citizen.setDataofbirth(dateofbirth);
	      citizen.setEmail(email);
	      citizen.setPassword(password);
	      citizen.setContact(contact);
	      citizen.setAadhaarnumber(aadhaarnumber);;
	      citizen.setStatus(status);
	      
	      String msg = adminService.addcitizen(citizen);
	      
	      ModelAndView mv = new ModelAndView("citizensuccess");
	      mv.addObject("message", msg);
	    
	      return mv;

	   }
	

	
}

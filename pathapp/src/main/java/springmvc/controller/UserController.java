package springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import springmvc.dao.PatientDao;
import springmvc.dao.RequestedTestsDao;
import springmvc.dao.SampleDao;
import springmvc.dao.TechnicianDao;
import springmvc.dao.TestDao;
import springmvc.dao.UserDao;
import springmvc.model.IncompletedTests;
import springmvc.model.Patient;
import springmvc.model.RequestedTests;
import springmvc.model.Technicians;
import springmvc.model.Test;
import springmvc.model.UserSystem;

@Controller
public class UserController {
	@Autowired
	public UserDao udao;
	
	@Autowired
	public TechnicianDao techdao;
	
	@Autowired
	public PatientDao pdao;
	
	@Autowired
	public TestDao testdao;
	
	@Autowired
	public SampleDao sampledao;
	
	@Autowired
	public RequestedTestsDao requestdao;
	
	@RequestMapping("/UserSystem1")
	public String UserSystem1 (Model m)
	{
		m.addAttribute("user","Head Login");
		return "userSystem";
	}
	
	@RequestMapping("/UserSystem2")
	public String UserSystem2 (Model m)
	{
		m.addAttribute("user","Technician Login");
		return "userSystem";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("US");
		return "index";
	}
	
	@RequestMapping(path="/processUserForm", method = RequestMethod.POST)
	public String processUserForm(@RequestParam("technicianUId") int UId,@RequestParam("password") String password,
			HttpSession session,ModelMap mp,Model m)
	{
		//System.out.println(UId+password);
		
		UserSystem US = udao.checkUser(UId, password);
		if( US==null ) {
			mp.put("error", "Incorrect Technician ID or password, please try again");
			return "userSystem";
		}
		else {
			
			session.setAttribute("US", US);
			int TId= US.getT_ID();
			
			if(US.getAdmin()==true) {
				
				List<Technicians> tech = techdao.getTechnicianList(TId);
				List<Patient> patient = pdao.allPatients();
				List<Test> test = testdao.getAllTests();
				List<IncompletedTests> it = sampledao.getAllIncompletedSamples();
				
		
				int noTech=tech.size();
				int noTest=test.size();
				int noPatient=patient.size();
				int noit=it.size();
				
				m.addAttribute("noTech", noTech);
				m.addAttribute("noTest", noTest);
				m.addAttribute("noPatient", noPatient);
				m.addAttribute("noit", noit);
				
				m.addAttribute("tech",tech);
				m.addAttribute("patients", patient);
				m.addAttribute("test",test);
				m.addAttribute("it", it);
				
				return "welcomeHead";
			}
				
			else { 
				
				//List<Test> test;
				List<RequestedTests> rt = requestdao.getMySamples(TId);
				
				int nort = rt.size();
				m.addAttribute("nort", nort);
				
				m.addAttribute("rt", rt);
				
				return "welcomeTech";
				
			}
		}
		
	}
	
	@RequestMapping(path="/addTestTo", method=RequestMethod.POST )
	public String addTestTo(@ModelAttribute("test") Test test, ModelMap m, HttpServletRequest request)
	{
		
		testdao.addTest(test);
		return "redirect:/goback";
	}
	
	@RequestMapping("/delete/{t_ID}")
	public String deleteProduct( @PathVariable("t_ID") int TId, HttpServletRequest request ) 
	{
		this.techdao.deleteTechnician(TId);
		return "redirect:/goback";
	}
	
	@RequestMapping("/editTech/{testId}")
	public String editTechHandler(@PathVariable("testId") int testId,  @RequestParam("t_ID") int t_ID, HttpServletRequest request ) 
	{
		this.testdao.updateTechInTest(testId, t_ID);
		return "redirect:/goback";
	}
	@RequestMapping("/deleteT/{testType}")
	public String deleteTestbyTestType( @PathVariable("testType") String testType, HttpServletRequest request ) 
	{
		this.testdao.deleteTest(testType);
		return "redirect:/goback";
	}
	@RequestMapping("goback")
	public String welcomeHead(HttpSession session, Model m) {
		if(session.getAttribute("US")==null)
			return "index";
		UserSystem US = (UserSystem) session.getAttribute("US");
		int TId= US.getT_ID();
		
		if(US.getAdmin()==true) {
			List<Technicians> tech = techdao.getTechnicianList(TId);
			List<Patient> patient = pdao.allPatients();
			List<Test> test = testdao.getAllTests();
			List<IncompletedTests> it = sampledao.getAllIncompletedSamples();
			
	
			int noTech=tech.size();
			int noTest=test.size();
			int noPatient=patient.size();
			int noit=it.size();
			
			m.addAttribute("noTech", noTech);
			m.addAttribute("noTest", noTest);
			m.addAttribute("noPatient", noPatient);
			m.addAttribute("noit", noit);
			
			m.addAttribute("tech",tech);
			m.addAttribute("patients", patient);
			m.addAttribute("test",test);
			m.addAttribute("it", it);
			
			return "welcomeHead";
		}
			
		else { 
			//List<Test> test;
			List<RequestedTests> rt = requestdao.getMySamples(TId);
			
			int nort = rt.size();
			m.addAttribute("nort", nort);
			
			m.addAttribute("rt", rt);
			
			return "welcomeTech";
			
		}

	}
}

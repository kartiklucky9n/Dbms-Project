package springmvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.dao.PatientDao;
import springmvc.dao.SampleDao;
import springmvc.dao.TestDao;

@Controller
public class PatientController {
	@Autowired
	private PatientDao pdao;
	private SampleDao sdao;
	
	@RequestMapping("/patientCorner")
	public String patientCorner (Model m)
	{
		m.addAttribute("user","Patient Sign in");
		return "patientCorner";
	}
	
	@RequestMapping(path="/processPatient", method = RequestMethod.POST)
	public String processUserForm(@RequestParam("p_ID") int pid,@RequestParam("hopitalOPNumber") long password,
			HttpSession session,ModelMap mp,Model m)
	{
		return ""; 
	}
	
	
	@RequestMapping(path="/deleteTest/{testType}")
	public String deleteTest(@PathVariable("testType") String testType, HttpSession session, Model m ) {
		
		return "testDeleted";
	}
	
	
	@RequestMapping(path="/updateTech/{testId}/{T_ID}")
	public String updateTestTech(@PathVariable("testId") int testId, @PathVariable("T_ID") int T_ID, HttpSession session, Model m) 
	{
		
		return "testUpdated";
		
	}
}

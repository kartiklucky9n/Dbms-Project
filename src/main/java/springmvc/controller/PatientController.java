package springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.dao.FinalReportDao;
import springmvc.dao.PatientDao;
import springmvc.dao.RequestedTestsDao;
import springmvc.dao.SampleDao;
import springmvc.dao.TestDao;
import springmvc.model.FinalReport;
import springmvc.model.Patient;
import springmvc.model.Sample;
import springmvc.model.Test;

@Controller
public class PatientController {
	@Autowired
	private PatientDao pdao;
	@Autowired
	private SampleDao sdao;
	@Autowired
	private TestDao testdao;
	@Autowired
	private RequestedTestsDao rdao; 
	@Autowired
	private FinalReportDao fdao;
	
	@RequestMapping("/patientCorner")
	public String patientCorner (Model m)
	{
		m.addAttribute("user","Patient Sign in");
		return "patientCorner";
	}
	@RequestMapping("/navpatient")
	public String navpatient (Model m)
	{
		
		return "navpatient";
	}
	
	@RequestMapping(path="/processPatient", method = RequestMethod.POST)
	public String processUserForm(@RequestParam("p_ID") int pid,@RequestParam("hopitalOPNumber") long password,
			HttpSession session,ModelMap mp,Model m)
	{
		if(pdao.checkPatient(pid, password)==null) {
			m.addAttribute("error", "Incorrect patient id or hopital op number");
			return "patientCorner";
		}
		Patient p = pdao.onePatient(pid);
		session.setAttribute("patient", p );
		
		
		
		List<Test> T = testdao.getAllTests();
		List<Sample> S = sdao.viewMySample(pid);
		m.addAttribute("tests", T);
		m.addAttribute("samples", S);
		m.addAttribute("nosamples", (int)S.size());
		m.addAttribute("notests", (int)T.size());
		m.addAttribute("p",p);
		return "patientHome"; 
	}
	
	@RequestMapping("gobackto")
	public String welcomePatient(HttpSession session, Model m) {
		if(session.getAttribute("patient")==null ) {
			return "index";
		}
		
		
		Patient P = (Patient) session.getAttribute("patient");

		List<Test> T = testdao.getAllTests();
		List<Sample> S = sdao.viewMySample(P.getP_ID());
		m.addAttribute("tests", T);
		m.addAttribute("samples", S);
		m.addAttribute("nosamples", (int)S.size());
		m.addAttribute("notests", (int)T.size());
		m.addAttribute("p",P);
		return "patientHome";
	}
	
	@RequestMapping(path="/processPatientSample/{p_ID}", method = RequestMethod.POST)
	public String processPatientSample(@PathVariable("p_ID") int pid, @RequestParam("sel1") String sampleType, Model m) 
	{
			System.out.println(pid + sampleType);
		
			int r= this.sdao.addSample(sampleType, pid);
			if(r==0) {
				m.addAttribute("error", "The requested sample has already been added");
				return "errorPatient";
			}
		
		return "redirect:/gobackto";
		
	}
	
	@RequestMapping(path="/requestTest", method = RequestMethod.POST)
	public String requestTest(@RequestParam("sampleId") int sampleId, @RequestParam("testId") int testId, Model m, HttpSession session) 
	{
			System.out.println(sampleId+testId);
		
			int r= this.rdao.doTest(sampleId, testId);
			if(r==0) {
				m.addAttribute("error","The requested test has already been added");
				return "errorPatient";
			}
			
			
		return "redirect:/gobackto";
		
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
	
	@RequestMapping(path="/viewReport", method = RequestMethod.POST)
	public String viewReport( @RequestParam("sampleId") int sampleId, Model m) 
	{
		System.out.println("----------"+sampleId);
		FinalReport report = this.fdao.viewReports( sampleId);
		Sample s = this.sdao.getSample(sampleId);
		System.out.println(report);
		System.out.println(s);
		m.addAttribute("sample",s);
		m.addAttribute("report", report);
		return "patientReport";
		
	}
}

package springmvc.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
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

import springmvc.dao.FinalReportDao;
import springmvc.dao.PatientDao;
import springmvc.dao.RequestedTestsDao;
import springmvc.dao.SampleDao;
import springmvc.dao.StorageBoxDao;
import springmvc.dao.TechnicianDao;
import springmvc.dao.TestDao;
import springmvc.dao.UserDao;
import springmvc.model.FinalReport;
import springmvc.model.IncompletedTests;
import springmvc.model.Patient;
import springmvc.model.RequestedTests;
import springmvc.model.Sample;
import springmvc.model.StorageBox;
import springmvc.model.Technicians;
import springmvc.model.Test;
import springmvc.model.UserSystem;
import springmvc.model.singlesample;

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

	@Autowired
	public FinalReportDao finaldao;
	
	@Autowired
	public StorageBoxDao storagedao;

	public String bytesToHex(byte bytes[]) {
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}

	public String encode(String password) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			byte[] result = md.digest(password.getBytes(StandardCharsets.UTF_8));
			String hex = bytesToHex(result);
			return hex;

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/UserSystem1")
	public String UserSystem1(Model m) {
		m.addAttribute("user", "Head Login");
		return "userSystem";
	}

	@RequestMapping("/UserSystem2")
	public String UserSystem2(Model m) {
		m.addAttribute("user", "Technician Login");
		return "userSystem";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("US");
		return "redirect:/index";
	}
	@RequestMapping(path = "/processUserForm", method = RequestMethod.POST)
	public String processUserForm(@RequestParam("technicianUId") int UId, @RequestParam("password") String password,
			HttpSession session, ModelMap mp, Model m) {
		// System.out.println(UId+password);
		String temp = encode(password);
		System.out.println(password);
		password = temp;
		UserSystem US = udao.checkUser(UId, password);
		if (US == null) {
			mp.put("error", "Incorrect Technician ID or password, please try again");
			return "userSystem";
		} else {

			session.setAttribute("US", US);
			int TId = US.getT_ID();

			if (US.getAdmin() == true) {

				List<Technicians> tech = techdao.getTechnicianList(TId);
				List<Patient> patient = pdao.allPatients();
				List<Test> test = testdao.getAllTests();
				List<IncompletedTests> it = sampledao.getAllIncompletedSamples();
				List<Sample> sample = sampledao.notRecievedSample();
				List<StorageBox> box = storagedao.getBoxes();
				Technicians technician = techdao.getTechnician(TId);
				
				int noTech = tech.size();
				int noTest = test.size();
				int noPatient = patient.size();
				int noit = it.size();
				int nosample = sample.size();
				int nobox=box.size();
				
				
				m.addAttribute("noTech", noTech);
				m.addAttribute("noTest", noTest);
				m.addAttribute("noPatient", noPatient);
				m.addAttribute("noit", noit);
				m.addAttribute("nosample", nosample);
				m.addAttribute("nobox",nobox);
				m.addAttribute("tech", tech);
				m.addAttribute("patients", patient);
				m.addAttribute("test", test);
				m.addAttribute("it", it);
				m.addAttribute("sample", sample);
				m.addAttribute("box", box);
				m.addAttribute("technician", technician);
				m.addAttribute("user", US.getTechnicianUId());
				return "welcomeHead";
				
			}

			else {

				// List<Test> test;
				List<RequestedTests> rt = requestdao.getMySamples(TId);
				List<RequestedTests> recievedtest = requestdao.recievedSample(TId);
				List<singlesample> sampledone = requestdao.doneSamples();
				List<Sample> sample = sampledao.notRecievedSample();
				List<StorageBox> box = storagedao.getBoxes();
				Technicians tech = techdao.getTechnician(TId);
				
				int nort = rt.size();
				int norecievedtest = recievedtest.size();
				int nosampledone = sampledone.size();
				int nosample = sample.size();
				int nobox=box.size();
				
				m.addAttribute("nort", nort);
				m.addAttribute("norecievedtest", norecievedtest);
				m.addAttribute("nosampledone", nosampledone);
				m.addAttribute("nosample", nosample);
				m.addAttribute("nobox",nobox);
				
				m.addAttribute("rt", rt);
				m.addAttribute("recievedtest", recievedtest);
				m.addAttribute("sampledone", sampledone);
				m.addAttribute("sample", sample);
				m.addAttribute("box", box);
				m.addAttribute("technician", tech);
				m.addAttribute("user", US.getTechnicianUId());
				return "welcomeTech";

			}
		}

	}

	@RequestMapping("goback")
	public String welcomeHead(HttpSession session, Model m) {
		if (session.getAttribute("US") == null)
			return "index";
		UserSystem US = (UserSystem) session.getAttribute("US");
		int TId = US.getT_ID();
		
		if (US.getAdmin() == true) {

			List<Technicians> tech = techdao.getTechnicianList(TId);
			List<Patient> patient = pdao.allPatients();
			List<Test> test = testdao.getAllTests();
			List<IncompletedTests> it = sampledao.getAllIncompletedSamples();
			List<Sample> sample = sampledao.notRecievedSample();
			List<StorageBox> box = storagedao.getBoxes();
			Technicians technician = techdao.getTechnician(TId);
			
			int noTech = tech.size();
			int noTest = test.size();
			int noPatient = patient.size();
			int noit = it.size();
			int nosample = sample.size();
			int nobox=box.size();
			
			
			m.addAttribute("noTech", noTech);
			m.addAttribute("noTest", noTest);
			m.addAttribute("noPatient", noPatient);
			m.addAttribute("noit", noit);
			m.addAttribute("nosample", nosample);
			m.addAttribute("nobox",nobox);
			m.addAttribute("tech", tech);
			m.addAttribute("patients", patient);
			m.addAttribute("test", test);
			m.addAttribute("it", it);
			m.addAttribute("sample", sample);
			m.addAttribute("box", box);
			m.addAttribute("technician", technician);
			m.addAttribute("user", US.getTechnicianUId());
			return "welcomeHead";
		}

		else {
			// List<Test> test;
			List<RequestedTests> rt = requestdao.getMySamples(TId);
			List<RequestedTests> recievedtest = requestdao.recievedSample(TId);
			List<singlesample> sampledone = requestdao.doneSamples();
			List<Sample> sample = sampledao.notRecievedSample();
			List<StorageBox> box = storagedao.getBoxes();
			Technicians tech = techdao.getTechnician(TId);
			
			int nort = rt.size();
			int norecievedtest = recievedtest.size();
			int nosampledone = sampledone.size();
			int nosample = sample.size();
			int nobox=box.size();
			
			m.addAttribute("nort", nort);
			m.addAttribute("norecievedtest", norecievedtest);
			m.addAttribute("nosampledone", nosampledone);
			m.addAttribute("nosample", nosample);
			m.addAttribute("nobox",nobox);
			
			m.addAttribute("rt", rt);
			m.addAttribute("recievedtest", recievedtest);
			m.addAttribute("sampledone", sampledone);
			m.addAttribute("sample", sample);
			m.addAttribute("box", box);
			m.addAttribute("technician", tech);
			m.addAttribute("user", US.getTechnicianUId());
			return "welcomeTech";

		}

	}
	
	@RequestMapping("/allreport")
	public String reports(@RequestParam("startdate") Date start, @RequestParam("enddate") Date end, Model m) {
		
		int s = start.compareTo(end);
		if(s>0) {
			return "errorallreports";
		}
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		List<FinalReport> search =  this.finaldao.searchreports(start, end);
		m.addAttribute("nosearch", search.size());
		m.addAttribute("search", search);
		return "allreports";
	}
	@RequestMapping("/allreport2")
	public String reports2(@RequestParam("startdate") Date start, @RequestParam("enddate") Date end, @RequestParam("testId") int testId,
			@RequestParam("optradio") String val ,Model m) {
		
		int s = start.compareTo(end);
		if(s>0) {
			return "errorallreports";
		}
		
		System.out.println(val);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		List<RequestedTests> search =  this.finaldao.searchreports2(start, end, testId, val);
		m.addAttribute("nosearch", search.size());
		m.addAttribute("search", search);
		m.addAttribute("single", this.testdao.singleTest(testId));
		return "allreports2";
	}
	@RequestMapping(path = "/addTestTo", method = RequestMethod.POST)
	public String addTestTo(@ModelAttribute("test") Test test, ModelMap m, HttpServletRequest request) {

		testdao.addTest(test);
		return "redirect:/goback";
	}

	@RequestMapping("/delete/{t_ID}")
	public String deleteProduct(@PathVariable("t_ID") int TId, HttpServletRequest request) {
		this.techdao.deleteTechnician(TId);
		return "redirect:/goback";
	}

	@RequestMapping("/editTech/{testId}")
	public String editTechHandler(@PathVariable("testId") int testId, @RequestParam("t_ID") int t_ID,
			HttpServletRequest request) {
		this.testdao.updateTechInTest(testId, t_ID);
		return "redirect:/goback";
	}

	@RequestMapping("/deleteT/{testType}")
	public String deleteTestbyTestType(@PathVariable("testType") String testType, HttpServletRequest request) {
		this.testdao.deleteTest(testType);
		return "redirect:/goback";
	}

	@RequestMapping("/recieve/{sampleId}")
	public String recieve(@PathVariable("sampleId") int sampleId, @RequestParam("boxId") int boxId, HttpServletRequest request) {
		this.sampledao.recievesample(sampleId, boxId);
		return "redirect:/goback";
	}
	
	
	@RequestMapping("/addtestrepo/{sampleId}/{testId}")
	public String addTestRepo(@PathVariable("sampleId") int sampleId, @PathVariable("testId") int testId, ModelMap m) {

		m.addAttribute("sampleId", sampleId);
		m.addAttribute("testId", testId);

		return "addtestreport";
	}

	@RequestMapping("/addtestreport/{sampleId}/{testId}")
	public String addTestRepo(@PathVariable("sampleId") int sampleId, @PathVariable("testId") int testId,
			@RequestParam("testReport") String testReport, @RequestParam("optradio") String val) {
		this.requestdao.addtestreport(sampleId, testId, testReport, val);

		return "redirect:/goback";
	}

	@RequestMapping("/addfinalrepo")
	public String addFinalRepo(@RequestParam("sampleId") int sampleId, ModelMap m) {
		m.addAttribute("sampleId", sampleId);
		List<RequestedTests> samplereports = requestdao.viewallreport(sampleId);
		int n=samplereports.size();
		m.addAttribute("nosamplereports",n);
		m.addAttribute("samplereports", samplereports);
		return "addfinalreport";

	}

	@RequestMapping("/addfinalreport/{sampleId}")
	public String addFinalReport(@PathVariable("sampleId") int sampleId,
			@RequestParam("resultOfReport") String resultOfReport, HttpSession session) {
		UserSystem us = (UserSystem) session.getAttribute("US");
		this.finaldao.addfinalreport(sampleId, resultOfReport, us.getT_ID());
		return "redirect:/goback";
	}
	@RequestMapping("/addbox")
	public String addBox(@RequestParam("containerType") String containerType) {
		this.storagedao.addBox(containerType);

		return "redirect:/goback";
	}
	
	@RequestMapping("/editdetails/{t_ID}")
	public String addBox(@PathVariable("t_ID") int TId, Model m) {
		Technicians t = techdao.getTechnician(TId);
		m.addAttribute("editTech", t);
		
		return "editTechdetails";
	}
	
	@RequestMapping(path="/editDetails", method = RequestMethod.POST)
	public String addBox(@ModelAttribute("technician") Technicians t, ModelMap m) {
		
		techdao.editTechnician(t);
		
		
		return "redirect:/goback";
	}
	@RequestMapping("/setattendance/{t_ID}/{var}")
	public String setattendance(@PathVariable("t_ID") int tid, @PathVariable("var") int v, ModelMap m) {

		this.techdao.setattendance(tid, v);

		return "redirect:/goback";
	}
}

package springmvc.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
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


import springmvc.dao.PatientDao;
import springmvc.dao.TechnicianDao;
import springmvc.dao.UserDao;

import springmvc.model.Patient;
import springmvc.model.Technicians;


@Controller
public class HomeController {
	@Autowired
	private PatientDao pDao;
	@Autowired
	private TechnicianDao tdao;
	@Autowired
	private UserDao udao;

	
	public String bytesToHex(byte bytes[])
	{
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}


	public String encode(String password) 
	{
		MessageDigest md;
		try 
		{
			md = MessageDigest.getInstance("SHA-256");
			byte[] result= md.digest(password.getBytes(StandardCharsets.UTF_8));
			String hex= bytesToHex(result);	
			return hex;

		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	
	
	@RequestMapping("/")
	public String index(HttpSession session)
	{
		
		if(session.getAttribute("US")!=null)
			session.removeAttribute("US");
		if(session.getAttribute("patient")!=null)
			session.removeAttribute("patient");
		
		return "index";
	}
	@RequestMapping("/index")
	public String home(HttpSession session)
	{
		if(session.getAttribute("US")!=null)
			session.removeAttribute("US");
		if(session.getAttribute("patient")!=null)
			session.removeAttribute("patient");
		return "index";
	}
	
	@RequestMapping("/contact")
	public String contacts(Model m) {
		List<Technicians> head=tdao.getHeads();
		int nohead=head.size();
		m.addAttribute("nohead", nohead);
		m.addAttribute("head", head);
		return "contact";
	} 
	@RequestMapping("/nav")
	public String nav()
	{
		return "nav";
	}
	@RequestMapping("/navhead")
	public String navhead()
	{
		return "navhead";
	}
	@RequestMapping("/navtech")
	public String navtech()
	{
		return "navtech";
	}
	@RequestMapping("/testnav")
	public String testnav()
	{
		return "testnav";
	}
	@RequestMapping("/patientForm")
	public String patientForm()
	{
		return "patientForm";
	}
	
	@RequestMapping("/technicianRegistration")
	public String technicianForm()
	{
		return "technicianRegistration";
	}
	@RequestMapping(path="/processPatientForm", method=RequestMethod.POST )	
	
	public String processPatientForm(@ModelAttribute("patient") Patient patient, ModelMap m, HttpServletRequest request)
	{		
			java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			int status=patient.getDOB().compareTo(date); //compareto is a function defined for date
	
			if(status>0) {
				m.addAttribute("error2","Please enter a valid date");
				return "patientForm";
			}
			
			Patient PID =pDao.addPatient(patient);
			if(PID ==null) {
				m.addAttribute("error","Please enter a unique hospital OP/IP number");
				return "patientForm";
			}
			m.addAttribute("success","Patient added succesfully");
			//System.out.println(PID);
			m.addAttribute("PID",PID.getP_ID());
			m.addAttribute("hospital",patient.getHospitalOPNumber());
			return "patientFormSuccess";
			
	}
	
	@RequestMapping("/patientFormSuccess" )
	public String formSuccess(ModelMap m) {
		
		return "patientFormSuccess";
		
	}
	
	@RequestMapping(path="/processTechnicianForm", method=RequestMethod.POST )	
	public String processTechnicianForm(@ModelAttribute("technician") Technicians t, ModelMap m)
	{
			int technicianUId = tdao.addTechnician(t);
			if(technicianUId == 0) {
				m.addAttribute("error","Already Registered");
				return "technicianRegistration";
			}
			
			
			m.addAttribute("success","Technician added succesfully");
			m.addAttribute("technicianUId", technicianUId);
			//System.out.println(PID);
			
			return "technicianRegSuccess";
			
	}
	@RequestMapping("/processTechnicianForm2/{uid}")	
	public String processTechnicianForm2(@PathVariable("uid") int uid, ModelMap m)
	{
			
			
		m.addAttribute("technicianUId", uid);
			return "technicianRegSuccess2";
			
	}
	
	@RequestMapping(path="/setpass/{technicianUId}", method=RequestMethod.POST )
	public String process_customer_form(@PathVariable("technicianUId") int tuid,  @RequestParam("password") String Password,ModelMap m)
	{
		//UserSystem US = udao.checkUser(tuid, "NAN");
		//System.out.println(US.getTechnicianUId()+US.getPassword());
		//System.out.println(Password);
		String s=encode(Password);
		//System.out.println(s);
		//US.setPassword(s);
			int r=udao.addUser(tuid,s);
			if(r==0)
				{
				m.put("error","USER is already registered");
				return "technicianRegistration";
				}
			return "redirect:/index";
	}
	
	
}
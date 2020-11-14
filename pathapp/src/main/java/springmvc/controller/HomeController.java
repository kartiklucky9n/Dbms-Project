package springmvc.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import springmvc.dao.PatientDao;
import springmvc.model.Patient;

@Controller
public class HomeController {
	@Autowired
	private PatientDao pDao;

	@RequestMapping("/")
	public String index()
	{
		return "index";
	}
	@RequestMapping("/index")
	public String home()
	{
		return "index";
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
		return "navhead";
	}
	@RequestMapping("/patientForm")
	public String patientForm()
	{
		return "patientForm";
	}
	
	@RequestMapping(path="/processPatientForm", method=RequestMethod.POST )	
	
	public String processPatientForm(@ModelAttribute("patient") Patient patient, ModelMap m, HttpServletRequest request)
	{
			Patient PID =pDao.addPatient(patient);
			if(PID ==null) {
				m.addAttribute("error","Please enter a unique hospital OP/IP number");
				return "patientForm";
			}
			m.addAttribute("success","Patient added succesfully");
			//System.out.println(PID);
			m.addAttribute("PID",PID.getP_ID());
			m.addAttribute("hospital",patient.getHospitalOPNumber());
			return "redirect:/patientFormSuccess";
			
	}
	
	@RequestMapping("/patientFormSuccess" )
	public String formSuccess(ModelMap m) {
		
		return "patientFormSuccess";
		
	}
	
	
}
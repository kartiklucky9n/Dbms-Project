package springmvc.model;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class Patient {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int P_ID;
	private String name;
	private String sex;	
	private String p_district;
	private String p_state;
	private int hospitalOPNumber;
	private Date DOB;
	private String t_district;
	private String t_state;
	private long contactNumber;
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getP_district() {
		return p_district;
	}
	public void setP_district(String p_district) {
		this.p_district = p_district;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	public int getHospitalOPNumber() {
		return hospitalOPNumber;
	}
	public void setHospitalOPNumber(int hospitalOPNumber) {
		this.hospitalOPNumber = hospitalOPNumber;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public String getT_district() {
		return t_district;
	}
	public void setT_district(String t_district) {
		this.t_district = t_district;
	}
	public String getT_state() {
		return t_state;
	}
	public void setT_state(String t_state) {
		this.t_state = t_state;
	}
	public long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}
	@Override
	public String toString() {
		return "Patient [P_ID=" + P_ID + ", name=" + name + ", sex=" + sex + ", p_district=" + p_district + ", p_state="
				+ p_state + ", hospitalOPNumber=" + hospitalOPNumber + ", DOB=" + DOB + ", t_district=" + t_district
				+ ", t_state=" + t_state + ", contactNumber=" + contactNumber + "]";
	}
	public Patient(int p_ID, String name, String sex, String p_district, String p_state, int hospitalOPNumber, Date dOB,
			String t_district, String t_state, long contactNumber) {
		super();
		P_ID = p_ID;
		this.name = name;
		this.sex = sex;
		this.p_district = p_district;
		this.p_state = p_state;
		this.hospitalOPNumber = hospitalOPNumber;
		DOB = dOB;
		this.t_district = t_district;
		this.t_state = t_state;
		this.contactNumber = contactNumber;
	}
	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
			  
			  
}

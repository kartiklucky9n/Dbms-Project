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
	private int p_pincode;	
	private String p_district;
	private int hospitalOPNumber;
	private Date DOB;
	private int t_pincode;
	private String t_district;
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
	public int getP_pincode() {
		return p_pincode;
	}
	public void setP_pincode(int p_pincode) {
		this.p_pincode = p_pincode;
	}
	public String getP_district() {
		return p_district;
	}
	public void setP_district(String p_district) {
		this.p_district = p_district;
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
	public int getT_pincode() {
		return t_pincode;
	}
	public void setT_pincode(int t_pincode) {
		this.t_pincode = t_pincode;
	}
	public String getT_district() {
		return t_district;
	}
	public void setT_district(String t_district) {
		this.t_district = t_district;
	}
	public long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}
	@Override
	public String toString() {
		return "Patient [P_ID=" + P_ID + ", name=" + name + ", sex=" + sex + ", p_pincode=" + p_pincode
				+ ", p_district=" + p_district + ", hospitalOPNumber=" + hospitalOPNumber + ", DOB=" + DOB
				+ ", t_pincode=" + t_pincode + ", t_district=" + t_district + ", contactNumber=" + contactNumber + "]";
	}
	public Patient(int p_ID, String name, String sex, int p_pincode, String p_district, int hospitalOPNumber, Date dOB,
			int t_pincode, String t_district, long contactNumber) {
		super();
		P_ID = p_ID;
		this.name = name;
		this.sex = sex;
		this.p_pincode = p_pincode;
		this.p_district = p_district;
		this.hospitalOPNumber = hospitalOPNumber;
		DOB = dOB;
		this.t_pincode = t_pincode;
		this.t_district = t_district;
		this.contactNumber = contactNumber;
	}
	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
			  
			  
}

package springmvc.model;



import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Technicians {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int T_ID;
	private String name;
	private String degree;
	private int yearOfPassing;
	private String emailId;
	private long phoneNumber;
	
	public int getT_ID() {
		return T_ID;
	}
	public void setT_ID(int t_ID) {
		T_ID = t_ID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public int getYearOfPassing() {
		return yearOfPassing;
	}
	public void setYearOfPassing(int yearOfPassing) {
		this.yearOfPassing = yearOfPassing;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public long getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	@Override
	public String toString() {
		return "Technician [T_ID=" + T_ID + ", name=" + name + ", degree=" + degree + ", yearOfPassing=" + yearOfPassing
				+ ", emailId=" + emailId + ", phoneNumber=" + phoneNumber + "]";
	}
	public Technicians(int t_ID, String name, String degree, int yearOfPassing, String emailId, long phoneNumber) {
		super();
		T_ID = t_ID;
		this.name = name;
		this.degree = degree;
		this.yearOfPassing = yearOfPassing;
		this.emailId = emailId;
		this.phoneNumber = phoneNumber;
	}
	public Technicians() {
		super();
		// TODO Auto-generated constructor stub
	}
			

}

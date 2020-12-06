package springmvc.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class UserSystem {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int technicianUId;
	private int T_ID; 	
	private String password;
	private Boolean admin;
	public int getTechnicianUId() {
		return technicianUId;
	}
	public void setTechnicianUId(int technicianUId) {
		this.technicianUId = technicianUId;
	}
	public int getT_ID() {
		return T_ID;
	}
	public void setT_ID(int t_ID) {
		T_ID = t_ID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "UserSystem [technicianUId=" + technicianUId + ", T_ID=" + T_ID + ", password=" + password + ", admin="
				+ admin + "]";
	}
	public UserSystem(int technicianUId, int t_ID, String password, Boolean admin) {
		super();
		this.technicianUId = technicianUId;
		T_ID = t_ID;
		this.password = password;
		this.admin = admin;
	}
	public UserSystem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

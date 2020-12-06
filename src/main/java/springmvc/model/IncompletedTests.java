package springmvc.model;

import java.sql.Date;

public class IncompletedTests {
	
	private int T_ID;
	private int sampleId;
	private int P_ID;
	private int testId;
	private Date dateOfAllotment;
	public int getT_ID() {
		return T_ID;
	}
	public void setT_ID(int t_ID) {
		T_ID = t_ID;
	}
	public int getSampleId() {
		return sampleId;
	}
	public void setSampleId(int sampleId) {
		this.sampleId = sampleId;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public Date getDateOfAllotment() {
		return dateOfAllotment;
	}
	public void setDateOfAllotment(Date dateOfAllotment) {
		this.dateOfAllotment = dateOfAllotment;
	}
	public IncompletedTests(int t_ID, int sampleId, int p_ID, int testId, Date dateOfAllotment) {
		super();
		T_ID = t_ID;
		this.sampleId = sampleId;
		P_ID = p_ID;
		this.testId = testId;
		this.dateOfAllotment = dateOfAllotment;
	}
	@Override
	public String toString() {
		return "IncompletedTests [T_ID=" + T_ID + ", sampleId=" + sampleId + ", P_ID=" + P_ID + ", testId=" + testId
				+ ", dateOfAllotment=" + dateOfAllotment + "]";
	}
	public IncompletedTests() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

package springmvc.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Test {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int testId;
	private String testType;
	private int T_ID;
	
	public int getT_ID() {
		return T_ID;
	}
	public void setT_ID(int t_ID) {
		T_ID = t_ID;
	}
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public Test(int testId, String testType, int t_ID) {
		super();
		this.testId = testId;
		this.testType = testType;
		T_ID = t_ID;
	}
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Test [testId=" + testId + ", testType=" + testType + ", T_ID=" + T_ID + "]";
	}

}	
	

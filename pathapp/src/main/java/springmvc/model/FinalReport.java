package springmvc.model;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

public class FinalReport {
	private int sampleId;
	private int T_ID;
	private int P_ID;
	private String resultOfReport;
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int reportId;
	private Date reportingDate;
	public int getSampleId() {
		return sampleId;
	}
	public void setSampleId(int sampleId) {
		this.sampleId = sampleId;
	}
	public int getT_ID() {
		return T_ID;
	}
	public void setT_ID(int t_ID) {
		T_ID = t_ID;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public String getResultOfReport() {
		return resultOfReport;
	}
	public void setResultOfReport(String resultOfReport) {
		this.resultOfReport = resultOfReport;
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public Date getReportingDate() {
		return reportingDate;
	}
	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate;
	}
	@Override
	public String toString() {
		return "FinalReport [sampleId=" + sampleId + ", T_ID=" + T_ID + ", P_ID=" + P_ID + ", resultOfReport="
				+ resultOfReport + ", reportId=" + reportId + ", reportingDate=" + reportingDate + "]";
	}
	public FinalReport(int sampleId, int t_ID, int p_ID, String resultOfReport, int reportId, Date reportingDate) {
		super();
		this.sampleId = sampleId;
		T_ID = t_ID;
		P_ID = p_ID;
		this.resultOfReport = resultOfReport;
		this.reportId = reportId;
		this.reportingDate = reportingDate;
	}
	public FinalReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

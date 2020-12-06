package springmvc.model;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

public class FinalReport {
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int reportId;
	private int sampleId;
	private int T_ID;
	private String resultOfReport;	
	private Date reportingDate;
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
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
	public String getResultOfReport() {
		return resultOfReport;
	}
	public void setResultOfReport(String resultOfReport) {
		this.resultOfReport = resultOfReport;
	}
	public Date getReportingDate() {
		return reportingDate;
	}
	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate;
	}
	@Override
	public String toString() {
		return "FinalReport [reportId=" + reportId + ", sampleId=" + sampleId + ", T_ID=" + T_ID + ", resultOfReport="
				+ resultOfReport + ", reportingDate=" + reportingDate + "]";
	}
	public FinalReport(int reportId, int sampleId, int t_ID, String resultOfReport, Date reportingDate) {
		super();
		this.reportId = reportId;
		this.sampleId = sampleId;
		T_ID = t_ID;
		this.resultOfReport = resultOfReport;
		this.reportingDate = reportingDate;
	}
	public FinalReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

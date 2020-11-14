package springmvc.model;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Sample {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sampleId;
	private String sampleType;
	private Date reportingDate;
	private Date recievingDate;
	private Date dateOfAllotment;
	private int P_ID;
	private int boxId;
	public int getSampleId() {
		return sampleId;
	}
	public void setSampleId(int sampleId) {
		this.sampleId = sampleId;
	}
	public String getSampleType() {
		return sampleType;
	}
	public void setSampleType(String sampleType) {
		this.sampleType = sampleType;
	}
	public Date getReportingDate() {
		return reportingDate;
	}
	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate;
	}
	public Date getRecievingDate() {
		return recievingDate;
	}
	public void setRecievingDate(Date recievingDate) {
		this.recievingDate = recievingDate;
	}
	public Date getDateOfAllotment() {
		return dateOfAllotment;
	}
	public void setDateOfAllotment(Date dateOfAllotment) {
		this.dateOfAllotment = dateOfAllotment;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public int getBoxId() {
		return boxId;
	}
	public void setBoxId(int boxId) {
		this.boxId = boxId;
	}
	@Override
	public String toString() {
		return "Sample [sampleId=" + sampleId + ", sampleType=" + sampleType + ", reportingDate=" + reportingDate
				+ ", recievingDate=" + recievingDate + ", dateOfAllotment=" + dateOfAllotment + ", P_ID=" + P_ID
				+ ", boxId=" + boxId + "]";
	}
	public Sample(int sampleId, String sampleType, Date reportingDate, Date recievingDate, Date dateOfAllotment,
			int p_ID, int boxId) {
		super();
		this.sampleId = sampleId;
		this.sampleType = sampleType;
		this.reportingDate = reportingDate;
		this.recievingDate = recievingDate;
		this.dateOfAllotment = dateOfAllotment;
		P_ID = p_ID;
		this.boxId = boxId;
	}
	public Sample() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

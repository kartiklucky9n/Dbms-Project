package springmvc.model;

import java.sql.Date;

public class RequestedTests {
		private int sampleId;
		private int testId;
		private String testReport;
		private boolean isCompleted;
		private boolean verdict;
		private Date reportDate;
		public int getSampleId() {
			return sampleId;
		}
		public void setSampleId(int sampleId) {
			this.sampleId = sampleId;
		}
		public int getTestId() {
			return testId;
		}
		public void setTestId(int testId) {
			this.testId = testId;
		}
		public String getTestReport() {
			return testReport;
		}
		public void setTestReport(String testReport) {
			this.testReport = testReport;
		}
		public boolean isCompleted() {
			return isCompleted;
		}
		public void setCompleted(boolean isCompleted) {
			this.isCompleted = isCompleted;
		}
		public boolean isVerdict() {
			return verdict;
		}
		public void setVerdict(boolean verdict) {
			this.verdict = verdict;
		}
		public Date getReportDate() {
			return reportDate;
		}
		public void setReportDate(Date reportDate) {
			this.reportDate = reportDate;
		}
		@Override
		public String toString() {
			return "RequestedTests [sampleId=" + sampleId + ", testId=" + testId + ", testReport=" + testReport
					+ ", isCompleted=" + isCompleted + ", verdict=" + verdict + ", reportDate=" + reportDate + "]";
		}
		public RequestedTests(int sampleId, int testId, String testReport, boolean isCompleted, boolean verdict,
				Date reportDate) {
			super();
			this.sampleId = sampleId;
			this.testId = testId;
			this.testReport = testReport;
			this.isCompleted = isCompleted;
			this.verdict = verdict;
			this.reportDate = reportDate;
		}
		public RequestedTests() {
			super();
			// TODO Auto-generated constructor stub
		}
		
	
}

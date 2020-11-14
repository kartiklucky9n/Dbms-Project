package springmvc.model;

public class RequestedTests {
		private int sampleId;
		private int testId;
		private String testReport;
		private boolean isCompleted;
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
		@Override
		public String toString() {
			return "RequestedTests [sampleId=" + sampleId + ", testId=" + testId + ", testReport=" + testReport
					+ ", isCompleted=" + isCompleted + "]";
		}
		public RequestedTests(int sampleId, int testId, String testReport, boolean isCompleted) {
			super();
			this.sampleId = sampleId;
			this.testId = testId;
			this.testReport = testReport;
			this.isCompleted = isCompleted;
		}
		public RequestedTests() {
			super();
			// TODO Auto-generated constructor stub
		}
	
}

package springmvc.model;

public class singlesample {
	private int sampleId;

	public singlesample() {
		super();
		// TODO Auto-generated constructor stub
	}

	public singlesample(int sampleId) {
		super();
		this.sampleId = sampleId;
	}

	@Override
	public String toString() {
		return "singlesample [sampleId=" + sampleId + "]";
	}

	public int getSampleId() {
		return sampleId;
	}

	public void setSampleId(int sampleId) {
		this.sampleId = sampleId;
	}
}
